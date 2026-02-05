import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_tabbar_minimize/liquid_tabbar_minimize.dart';
import 'package:moviepilot_mobile/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:moviepilot_mobile/modules/dashboard/pages/dashboard_page.dart';
import 'package:moviepilot_mobile/modules/discover/controllers/discover_controller.dart';
import 'package:moviepilot_mobile/modules/discover/pages/discover_page.dart';
import 'package:moviepilot_mobile/modules/multifunction/controllers/multifunction_controller.dart';
import 'package:moviepilot_mobile/modules/multifunction/pages/multifunction_page.dart';
import 'package:moviepilot_mobile/modules/recommend/controllers/recommend_controller.dart';
import 'package:moviepilot_mobile/modules/recommend/pages/recommend_page.dart';
import 'package:moviepilot_mobile/theme/app_theme.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;
  double _lastScrollOffset = 0;

  // Language toggle for testing locale label updates
  final dashboardController = Get.put(DashboardController());
  // Dynamic labels based on language
  List<String> get _labels => ['仪表盘', '推荐', '探索', '更多'];

  // Separate ScrollController for each page
  late final ScrollController _homeScrollController;
  late final ScrollController _recommendScrollController;
  late final ScrollController _discoverScrollController;
  late final ScrollController _multifunctionScrollController;

  @override
  void initState() {
    super.initState();
    Get.put(RecommendController());
    Get.put(DiscoverController());
    Get.put(MultifunctionController());
    _homeScrollController = ScrollController()
      ..addListener(() => _onScroll(_homeScrollController));
    _recommendScrollController = ScrollController()
      ..addListener(() => _onScroll(_recommendScrollController));
    _discoverScrollController = ScrollController()
      ..addListener(() => _onScroll(_discoverScrollController));
    _multifunctionScrollController = ScrollController()
      ..addListener(() => _onScroll(_multifunctionScrollController));
  }

  @override
  void dispose() {
    _homeScrollController.dispose();
    _recommendScrollController.dispose();
    _discoverScrollController.dispose();
    _multifunctionScrollController.dispose();
    super.dispose();
  }

  void _onScroll(ScrollController controller) {
    final offset = controller.offset;
    final delta = offset - _lastScrollOffset;

    _handleScroll(offset, delta);

    _lastScrollOffset = offset;
  }

  void _handleScroll(double offset, double delta) {
    LiquidBottomNavigationBar.handleScroll(offset, delta);
  }

  void _stopCurrentScrollMomentum() {
    ScrollController? controller;
    switch (_selectedIndex) {
      case 0:
        controller = _homeScrollController;
      case 1:
        controller = _recommendScrollController;
      case 2:
        controller = _discoverScrollController;
      case 3:
        controller = _multifunctionScrollController;
    }
    if (controller != null && controller.hasClients) {
      controller.animateTo(
        controller.offset,
        duration: Duration.zero,
        curve: Curves.linear,
      );
    }
  }

  // Dedicated page for each tab

  Widget _buildSearchPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.search, size: 64, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          const Text(
            'Search',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Find what you need',
            style: TextStyle(fontSize: 16, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DashboardPage(),
          RecommendPage(scrollController: _recommendScrollController),
          DiscoverPage(scrollController: _discoverScrollController),
          MultifunctionPage(scrollController: _multifunctionScrollController),
          _buildSearchPage(),
        ],
      ),
      bottomNavigationBar: LiquidBottomNavigationBar(
        selectedItemColor: context.primaryColor,
        unselectedItemColor: context.textSecondaryColor,
        enableMinimize: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          _lastScrollOffset = 0;
          debugPrint('Tab index: $index');
        },
        items: [
          LiquidTabItem(
            widget: const Icon(Icons.home_outlined),
            selectedWidget: const Icon(Icons.home),
            sfSymbol: 'house',
            selectedSfSymbol: 'house.fill',
            label: _labels[0],
          ),
          LiquidTabItem(
            widget: const Icon(Icons.movie_outlined),
            selectedWidget: const Icon(Icons.movie),
            sfSymbol: 'film',
            selectedSfSymbol: 'film.fill',
            label: _labels[1],
          ),
          LiquidTabItem(
            widget: const Icon(Icons.explore_outlined),
            selectedWidget: const Icon(Icons.explore),
            sfSymbol: 'safari',
            selectedSfSymbol: 'safari.fill',
            label: _labels[2],
          ),
          LiquidTabItem(
            widget: const Icon(Icons.grid_view_outlined),
            selectedWidget: const Icon(Icons.grid_view),
            sfSymbol: 'square.grid.2x2',
            selectedSfSymbol: 'square.grid.2x2.fill',
            label: _labels[3],
          ),
        ],
        showActionButton: false,
        actionButton: ActionButtonConfig(
          const Icon(Icons.search),
          'magnifyingglass',
        ),
        onActionTap: () {
          debugPrint('Search tapped!');
          _stopCurrentScrollMomentum();
          setState(() {
            _selectedIndex = 4;
            _lastScrollOffset = 0;
          });
        },
        labelVisibility: LabelVisibility.always,
        height: 68,
        forceCustomBar: false,
        collapseStartOffset: 100,
        animationDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
