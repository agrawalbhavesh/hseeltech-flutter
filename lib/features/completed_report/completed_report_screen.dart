import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// CompletedReportScreen — Detailed report for fully-funded opportunities
/// Route: /completed-report
/// Shows historical performance, achieved returns, quarterly breakdown,
/// investment timeline, and downloadable documents.

class CompletedReportScreen extends StatefulWidget {
  final String opportunityId;
  const CompletedReportScreen({super.key, required this.opportunityId});

  @override
  State<CompletedReportScreen> createState() => _CompletedReportScreenState();
}

class _CompletedReportScreenState extends State<CompletedReportScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  Map<String, dynamic>? _reportData;

  final List<String> _tabs = ['overview', 'returns', 'timeline', 'documents'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadReportData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadReportData() async {
    // TODO: Fetch completed opportunity report from API
    // GET /api/opportunities/{id}/report
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
      _reportData = {
        'name': 'Sample Completed Project',
        'totalReturn': 12.5,
        'investedAmount': 50000,
        'currentValue': 56250,
        'status': 'completed',
        'completedDate': '2025-12-15',
        'quarterlyReturns': [3.2, 2.8, 3.5, 3.0],
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF2D6A4F)))
          : CustomScrollView(
              slivers: [
                // Hero Image with Gradient Overlay
                SliverAppBar(
                  expandedHeight: 220,
                  pinned: true,
                  backgroundColor: const Color(0xFF1B2A4A),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://example.com/property.jpg',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                        // Completed Badge
                        Positioned(
                          top: 60,
                          right: isRtl ? null : 16,
                          left: isRtl ? 16 : null,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2D6A4F),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.check_circle, color: Colors.white, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  l10n.completed,
                                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Property Name
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Text(
                            _reportData!['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Tab Bar
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _TabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF2D6A4F),
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color(0xFF2D6A4F),
                      tabs: [
                        Tab(text: l10n.overview),
                        Tab(text: l10n.returns),
                        Tab(text: l10n.timeline),
                        Tab(text: l10n.documents),
                      ],
                    ),
                  ),
                ),

                // Tab Content
                SliverFillRemaining(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildOverviewTab(l10n),
                      _buildReturnsTab(l10n),
                      _buildTimelineTab(l10n),
                      _buildDocumentsTab(l10n),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildOverviewTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Total Return Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2D6A4F), Color(0xFF40916C)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  l10n.totalReturn,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  '${_reportData!['totalReturn']}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Investment Summary Row
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  l10n.investedAmount,
                  '${_reportData!['investedAmount']} ${l10n.sar}',
                  const Color(0xFF1B2A4A),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  l10n.currentValue,
                  '${_reportData!['currentValue']} ${l10n.sar}',
                  const Color(0xFF2E5090),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReturnsTab(AppLocalizations l10n) {
    final quarters = _reportData!['quarterlyReturns'] as List;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.quarterlyBreakdown,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...List.generate(quarters.length, (i) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Q${i + 1}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(
                    '+${quarters[i]}%',
                    style: const TextStyle(
                      color: Color(0xFF2D6A4F),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.investmentTimeline,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTimelineItem(l10n.investmentDate, '2024-06-15', Icons.attach_money, true),
          _buildTimelineItem(l10n.fundingComplete, '2024-07-01', Icons.check_circle, true),
          _buildTimelineItem('Q1 ${l10n.distribution}', '2024-10-01', Icons.payments, true),
          _buildTimelineItem('Q2 ${l10n.distribution}', '2025-01-01', Icons.payments, true),
          _buildTimelineItem('Q3 ${l10n.distribution}', '2025-04-01', Icons.payments, true),
          _buildTimelineItem('Q4 ${l10n.distribution}', '2025-07-01', Icons.payments, true),
          _buildTimelineItem(l10n.projectCompleted, '2025-12-15', Icons.flag, true),
        ],
      ),
    );
  }

  Widget _buildDocumentsTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.documents,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildDocumentItem(l10n.investmentCertificate, 'PDF', Icons.description),
          _buildDocumentItem(l10n.quarterlyReport, 'PDF', Icons.bar_chart),
          _buildDocumentItem(l10n.finalReport, 'PDF', Icons.summarize),
          _buildDocumentItem(l10n.taxDocument, 'PDF', Icons.receipt_long),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String title, String date, IconData icon, bool completed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: completed ? const Color(0xFF2D6A4F) : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(date, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ],
            ),
          ),
          if (completed)
            const Icon(Icons.check, color: Color(0xFF2D6A4F), size: 20),
        ],
      ),
    );
  }

  Widget _buildDocumentItem(String name, String type, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF2E5090).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF2E5090)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(type, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.download, color: Color(0xFF2E5090)),
            onPressed: () {
              // TODO: Download document
            },
          ),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => false;
}
