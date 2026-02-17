import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../models/opportunity.dart';
import '../services/favorites_service.dart';

/// SavedProjectsScreen — Displays user's bookmarked/favorited opportunities.
/// Route: /saved-projects
/// Comes from: Home (bookmark icon in header)
/// Goes to: /detail (tap card), /home (back)
///
/// Design specs (v3.0 updated):
/// - Background: white with blue gradient header (navy→blue)
/// - Header: gradient with wave overlay, white back arrow, centered white title
/// - Cards: approved design matching HomeScreen/ExploreScreen:
///   status badges (top-left), red bookmark badge (top-right),
///   property name, location with flag, 3 metrics row,
///   property specs (beds/baths/sqm), blue progress bar
/// - Empty state: blue circle with heart icon + title + explore button

class SavedProjectsScreen extends StatefulWidget {
  const SavedProjectsScreen({super.key});

  @override
  State<SavedProjectsScreen> createState() => _SavedProjectsScreenState();
}

class _SavedProjectsScreenState extends State<SavedProjectsScreen> {
  List<Opportunity> _savedOpportunities = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _isLoading = true);
    try {
      final favorites = await FavoritesService.instance.getFavorites();
      setState(() {
        _savedOpportunities = favorites;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _removeFavorite(String opportunityId) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.savedProjectsRemoveConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await FavoritesService.instance.removeFavorite(opportunityId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.savedProjectsRemoved)),
      );
      _loadFavorites();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Blue gradient header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 52, 16, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1B2A4A), Color(0xFF2E5090)],
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => context.pop(),
                ),
                Expanded(
                  child: Text(
                    l10n.savedProjectsTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Icon(Icons.bookmark_outline, color: Colors.white54, size: 20),
                const SizedBox(width: 8),
              ],
            ),
          ),
          // Content
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _savedOpportunities.isEmpty
                    ? _buildEmptyState(l10n)
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _savedOpportunities.length,
                        itemBuilder: (context, index) {
                          final opp = _savedOpportunities[index];
                          return _buildPropertyCard(opp, l10n);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFEDF2F9),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.favorite_border, size: 32, color: Color(0xFF2E5090)),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.savedProjectsEmptyTitle,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1B2A4A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.savedProjectsEmptyDesc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/explore'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E5090),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(l10n.savedProjectsExplore, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyCard(Opportunity opp, AppLocalizations l10n) {
    return GestureDetector(
      onTap: () => context.push('/detail', extra: opp),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with badges
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    opp.imageUrl,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Status badges (top-left) — matches HomeScreen design
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D6A4F),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          l10n.statusAvailable,
                          style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E5090),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          opp.type,
                          style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                // Red bookmark badge (top-right)
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () => _removeFavorite(opp.id),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEF4444),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.bookmark, color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ],
            ),
            // Content — matches approved card design
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    opp.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 12, color: Colors.grey[400]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          opp.location,
                          style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // 3 metrics row — matches HomeScreen design
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMetric(opp.expectedReturn, l10n.detailExpectedReturn),
                      _buildMetric(opp.netYield, l10n.financialNetYield),
                      _buildMetric(l10n.financialQuarterly, l10n.financialDistribution),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Property specs — matches HomeScreen design
                  Row(
                    children: [
                      Icon(Icons.bed, size: 12, color: Colors.grey[400]),
                      const SizedBox(width: 4),
                      Text('${opp.bedrooms} ${l10n.propertyBeds}', style: TextStyle(fontSize: 9, color: Colors.grey[400])),
                      const SizedBox(width: 12),
                      Icon(Icons.bathtub_outlined, size: 12, color: Colors.grey[400]),
                      const SizedBox(width: 4),
                      Text('${opp.bathrooms} ${l10n.propertyBaths}', style: TextStyle(fontSize: 9, color: Colors.grey[400])),
                      const SizedBox(width: 12),
                      Icon(Icons.aspect_ratio, size: 12, color: Colors.grey[400]),
                      const SizedBox(width: 4),
                      Text('${opp.sqm} ${l10n.propertySqm}', style: TextStyle(fontSize: 9, color: Colors.grey[400])),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Progress bar — matches HomeScreen design
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: opp.funded / 100,
                      backgroundColor: const Color(0xFFEDF2F9),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E5090)),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${opp.funded}% ${l10n.exploreFunded}',
                    style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Color(0xFF2D6A4F)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1B2A4A),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 8, color: Colors.grey[400]),
        ),
      ],
    );
  }
}
