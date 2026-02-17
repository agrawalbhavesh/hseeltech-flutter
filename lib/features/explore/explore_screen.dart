import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/widgets/bottom_nav.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Opportunity {
  final int id;
  final String name;
  final String location;
  final String image;
  final String type;
  final double annualReturn;
  final int tokenPrice;
  final int funded;
  final String status;
  final int minInvest;

  Opportunity({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.type,
    required this.annualReturn,
    required this.tokenPrice,
    required this.funded,
    required this.status,
    required this.minInvest,
  });
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _searchQuery = "";
  String _activeType = "All";
  bool _showFilters = false;
  String _sortBy = "Highest Return";

  final List<Opportunity> _opportunities = [
    Opportunity(
      id: 1,
      name: "Al-Olaya Towers",
      location: "Al-Olaya, Riyadh",
      image: "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=600&h=400&fit=crop",
      type: "Residential",
      annualReturn: 8.37,
      tokenPrice: 10000,
      funded: 74,
      status: "Available",
      minInvest: 10000,
    ),
    Opportunity(
      id: 2,
      name: "King Fahd Business Park",
      location: "King Fahd Road, Riyadh",
      image: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=600&h=400&fit=crop",
      type: "Commercial",
      annualReturn: 9.2,
      tokenPrice: 25000,
      funded: 45,
      status: "Available",
      minInvest: 25000,
    ),
    Opportunity(
      id: 3,
      name: "Corniche Residences",
      location: "Corniche, Jeddah",
      image: "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=600&h=400&fit=crop",
      type: "Residential",
      annualReturn: 7.5,
      tokenPrice: 5000,
      funded: 92,
      status: "Almost Full",
      minInvest: 5000,
    ),
    Opportunity(
      id: 4,
      name: "KAFD Office Tower",
      location: "KAFD, Riyadh",
      image: "https://images.unsplash.com/photo-1577495508048-b635879837f1?w=600&h=400&fit=crop",
      type: "Commercial",
      annualReturn: 10.1,
      tokenPrice: 50000,
      funded: 30,
      status: "New",
      minInvest: 50000,
    ),
    Opportunity(
      id: 5,
      name: "Al-Hamra Mall",
      location: "Al-Hamra, Riyadh",
      image: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&h=400&fit=crop",
      type: "Retail",
      annualReturn: 11.5,
      tokenPrice: 15000,
      funded: 60,
      status: "Available",
      minInvest: 15000,
    ),
  ];

  final List<String> _propertyTypes = ["All", "Residential", "Commercial", "Retail"];
  final List<String> _sortOptions = ["Highest Return", "Lowest Price", "Most Funded", "Newest"];

  List<Opportunity> get _filteredOpportunities {
    List<Opportunity> filtered = _opportunities.where((opp) {
      final matchesSearch = opp.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          opp.location.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesType = _activeType == "All" || opp.type == _activeType;
      return matchesSearch && matchesType;
    }).toList();

    filtered.sort((a, b) {
      if (_sortBy == "Highest Return") return b.annualReturn.compareTo(a.annualReturn);
      if (_sortBy == "Lowest Price") return a.tokenPrice.compareTo(b.tokenPrice);
      if (_sortBy == "Most Funded") return b.funded.compareTo(a.funded);
      return 0;
    });

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(r, styles, spacing),
            _buildFiltersPanel(r, styles, spacing),
            _buildTypeFilterPills(r, styles, spacing),
            _buildResultsCount(r, styles, spacing),
            Expanded(
              child: _buildOpportunityList(r, styles, spacing),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(activeTab: "explore"),
    );
  }

  Widget _buildHeader(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Container(
      padding: EdgeInsets.only(
        left: r.wp(5),
        right: r.wp(5),
        top: r.hp(6),
        bottom: r.hp(2),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1B2A4A), Color(0xFF243B5E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Explore", style: styles.heading1.copyWith(color: Colors.white)),
          r.verticalSpace(4),
          Text("Discover investment opportunities", style: styles.body.copyWith(color: const Color(0xFF94A3B8))),
          r.verticalSpace(16),
          _buildSearchBar(r, styles, spacing),
        ],
      ),
    );
  }

  Widget _buildSearchBar(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: r.wp(3.5), vertical: r.hp(1.5)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(r.radius(12)),
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: r.icon(16), color: const Color(0xFF94A3B8)),
                r.horizontalSpace(8),
                Expanded(
                  child: TextField(
                    onChanged: (value) => setState(() => _searchQuery = value),
                    style: styles.body.copyWith(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search properties...",
                      hintStyle: styles.body.copyWith(color: const Color(0xFF94A3B8)),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                if (_searchQuery.isNotEmpty)
                  GestureDetector(
                    onTap: () => setState(() => _searchQuery = ""),
                    child: Icon(Icons.close, size: r.icon(14), color: const Color(0xFF94A3B8)),
                  ),
              ],
            ),
          ),
        ),
        r.horizontalSpace(8),
        GestureDetector(
          onTap: () => setState(() => _showFilters = !_showFilters),
          child: Container(
            width: r.wp(10),
            height: r.wp(10),
            decoration: BoxDecoration(
              color: _showFilters ? const Color(0xFF4A7BC7) : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(r.radius(12)),
            ),
            child: Icon(Icons.filter_list, size: r.icon(16), color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildFiltersPanel(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _showFilters ? null : 0,
      width: double.infinity,
      child: Material(
        color: Colors.white,
        elevation: _showFilters ? 2 : 0,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(1.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sort by", style: styles.bodyBold.copyWith(color: const Color(0xFF1B1B1B))),
                    Icon(Icons.keyboard_arrow_down, size: r.icon(14), color: const Color(0xFF6B7280)),
                  ],
                ),
                r.verticalSpace(8),
                Wrap(
                  spacing: r.wp(1.5),
                  runSpacing: r.hp(1),
                  children: _sortOptions.map((opt) {
                    final bool isSelected = _sortBy == opt;
                    return ChoiceChip(
                      label: Text(opt),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _sortBy = opt);
                        }
                      },
                      backgroundColor: const Color(0xFFEDF2F9),
                      selectedColor: const Color(0xFF1B2A4A),
                      labelStyle: styles.caption.copyWith(
                        color: isSelected ? Colors.white : const Color(0xFF6B7280),
                      ),
                      avatar: isSelected ? Icon(Icons.check, size: r.icon(12), color: Colors.white) : null,
                      padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(r.radius(8)),
                        side: BorderSide(color: Colors.transparent),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeFilterPills(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(1.5)),
      child: SizedBox(
        height: r.hp(5),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _propertyTypes.length,
          separatorBuilder: (context, index) => r.horizontalSpace(8),
          itemBuilder: (context, index) {
            final type = _propertyTypes[index];
            final bool isSelected = _activeType == type;
            return ChoiceChip(
              label: Text(type == "All" ? "All Types" : type),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _activeType = type);
                }
              },
              backgroundColor: Colors.white,
              selectedColor: const Color(0xFF1B2A4A),
              labelStyle: styles.bodySmallBold.copyWith(
                color: isSelected ? Colors.white : const Color(0xFF6B7280),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(r.radius(12)),
                side: BorderSide(
                  color: isSelected ? const Color(0xFF1B2A4A) : const Color(0xFFE2E8F0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildResultsCount(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5)).copyWith(bottom: r.hp(1.5)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "${_filteredOpportunities.length} ${_filteredOpportunities.length == 1 ? "opportunity" : "opportunities"} found",
          style: styles.bodySmall.copyWith(color: const Color(0xFF9CA3AF)),
        ),
      ),
    );
  }

  Widget _buildOpportunityList(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    if (_filteredOpportunities.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: r.icon(40), color: const Color(0xFF9CA3AF)),
            r.verticalSpace(12),
            Text("No results found", style: styles.heading3.copyWith(color: const Color(0xFF1B1B1B))),
            r.verticalSpace(4),
            Text("Try adjusting your search or filters", style: styles.body.copyWith(color: const Color(0xFF9CA3AF))),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5)).copyWith(bottom: r.hp(3)),
      itemCount: _filteredOpportunities.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: r.hp(1.5)),
          child: OpportunityCardWidget(opportunity: _filteredOpportunities[index]),
        );
      },
    );
  }
}

class OpportunityCardWidget extends StatefulWidget {
  final Opportunity opportunity;

  const OpportunityCardWidget({Key? key, required this.opportunity}) : super(key: key);

  @override
  _OpportunityCardWidgetState createState() => _OpportunityCardWidgetState();
}

class _OpportunityCardWidgetState extends State<OpportunityCardWidget> {
  bool _liked = false;

  Color getStatusColor(String status) {
    if (status == "New") return const Color(0xFF3B82F6);
    if (status == "Almost Full") return const Color(0xFFF59E0B);
    return const Color(0xFF2D6A4F);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);
    final opp = widget.opportunity;

    return GestureDetector(
      onTap: () { /* Navigate to detail screen */ },
      child: Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r.radius(16)),
          side: BorderSide(color: const Color(0xFFE2E8F0)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            _buildCardImage(r, styles, opp),
            _buildCardContent(r, styles, spacing, opp),
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage(Responsive r, AppTextStyles styles, Opportunity opp) {
    return Stack(
      children: [
        Image.network(
          opp.image,
          height: r.hp(18),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: r.hp(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.3), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          top: r.wp(3),
          right: r.wp(3),
          child: GestureDetector(
            onTap: () => setState(() => _liked = !_liked),
            child: Container(
              width: r.icon(32),
              height: r.icon(32),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _liked ? Icons.favorite : Icons.favorite_border,
                color: _liked ? Colors.red : Colors.white,
                size: r.icon(16),
              ),
            ),
          ),
        ),
        Positioned(
          top: r.wp(3),
          left: r.wp(3),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: r.wp(2.5), vertical: r.hp(0.5)),
            decoration: BoxDecoration(
              color: getStatusColor(opp.status),
              borderRadius: BorderRadius.circular(r.radius(20)),
            ),
            child: Text(opp.status, style: styles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        Positioned(
          bottom: r.wp(3),
          left: r.wp(3),
          child: Row(
            children: [
              Icon(Icons.location_on, color: Colors.white.withOpacity(0.8), size: r.icon(12)),
              r.horizontalSpace(4),
              Text(opp.location, style: styles.caption.copyWith(color: Colors.white.withOpacity(0.9))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardContent(Responsive r, AppTextStyles styles, AppSpacing spacing, Opportunity opp) {
    return Padding(
      padding: EdgeInsets.all(r.wp(3.5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(opp.name, style: styles.bodyLargeBold.copyWith(color: const Color(0xFF1B1B1B))),
                  r.verticalSpace(4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.5)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF2F9),
                      borderRadius: BorderRadius.circular(r.radius(6)),
                    ),
                    child: Text(opp.type, style: styles.caption.copyWith(color: const Color(0xFF2E5090))),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${opp.annualReturn}%", style: styles.heading3.copyWith(color: const Color(0xFF2D6A4F))),
                  Text("Expected Annual Return", style: styles.caption.copyWith(color: const Color(0xFF9CA3AF))),
                ],
              ),
            ],
          ),
          r.verticalSpace(12),
          _buildFundingProgress(r, styles, opp),
          r.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: styles.bodyBold.copyWith(color: const Color(0xFF1B2A4A)),
                  children: [
                    TextSpan(text: "${opp.tokenPrice.toString()} SAR"),
                    TextSpan(
                      text: "/share",
                      style: styles.caption.copyWith(color: const Color(0xFF9CA3AF)),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () { /* Navigate to detail screen */ },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B2A4A),
                  padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(8))),
                ),
                child: Text("View Details", style: styles.bodySmallBold.copyWith(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFundingProgress(Responsive r, AppTextStyles styles, Opportunity opp) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${opp.funded}% funded", style: styles.caption.copyWith(color: const Color(0xFF6B7280))),
            Text("Min ${opp.minInvest.toString()} SAR", style: styles.caption.copyWith(color: const Color(0xFF9CA3AF))),
          ],
        ),
        r.verticalSpace(4),
        ClipRRect(
          borderRadius: BorderRadius.circular(r.radius(10)),
          child: LinearProgressIndicator(
            value: opp.funded / 100,
            minHeight: r.hp(0.75),
            backgroundColor: const Color(0xFFEDF2F9),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1B2A4A)),
          ),
        ),
      ],
    );
  }
}
"))- 1. **'ExploreScreen' (StatefulWidget):** Manages the overall state of the screen, including search queries, filter selections, and the list of opportunities. It builds the main layout with a header, filter panels, and the list of results. 2. **'OpportunityCardWidget' (StatefulWidget):** A reusable widget to display a single investment opportunity. It has its own state to handle the "like" functionality. 3. **Responsive Design:** All dimensions (padding, font sizes, icon sizes, etc.) are handled using the 'Responsive' utility class ('r.wp', 'r.hp', 'r.sp', 'r.icon', 'r.radius'). This ensures the UI adapts to different screen sizes. 4. **State Management:** The state is managed locally within the respective widgets ('_ExploreScreenState' and '_OpportunityCardWidgetState') using 'setState'. For a larger application, a more robust state management solution like Provider or BLoC would be recommended. 5. **Filtering and Sorting:** The '_filteredOpportunities' getter in '_ExploreScreenState' dynamically filters and sorts the list of opportunities based on the user
