import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_tabbar_minimize/liquid_tabbar_minimize.dart';
import 'package:moviepilot_mobile/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:moviepilot_mobile/modules/dashboard/pages/dashboard_page.dart';
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
  List<String> get _labels => ['Dashboard', '推荐', 'Favorites', 'Settings'];

  // Separate ScrollController for each page
  late final ScrollController _homeScrollController;
  late final ScrollController _recommendScrollController;
  late final ScrollController _favoritesScrollController;
  late final ScrollController _settingsScrollController;

  @override
  void initState() {
    super.initState();
    Get.put(RecommendController());
    _homeScrollController = ScrollController()
      ..addListener(() => _onScroll(_homeScrollController));
    _recommendScrollController = ScrollController()
      ..addListener(() => _onScroll(_recommendScrollController));
    _favoritesScrollController = ScrollController()
      ..addListener(() => _onScroll(_favoritesScrollController));
    _settingsScrollController = ScrollController()
      ..addListener(() => _onScroll(_settingsScrollController));
  }

  @override
  void dispose() {
    _homeScrollController.dispose();
    _recommendScrollController.dispose();
    _favoritesScrollController.dispose();
    _settingsScrollController.dispose();
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
        controller = _favoritesScrollController;
      case 3:
        controller = _settingsScrollController;
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

  Widget _buildFavoritesPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        controller: _favoritesScrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.withValues(alpha: 0.3),
              child: Icon(Icons.star, color: Colors.orange),
            ),
            title: Text('Favorite Item ${index + 1}'),
            subtitle: const Text('Tap to view details'),
            trailing: Icon(Icons.chevron_right, color: Colors.orange),
          );
        },
      ),
    );
  }

  Widget _buildSettingsPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        controller: _settingsScrollController,
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.purple.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildSettingsTile(
            Icons.notifications,
            'Notifications',
            'Manage notifications',
          ),
          _buildSettingsTile(Icons.privacy_tip, 'Privacy', 'Privacy settings'),
          _buildSettingsTile(Icons.language, 'Language', 'Change language'),
          _buildSettingsTile(Icons.dark_mode, 'Dark Mode', 'Toggle dark mode'),
          _buildSettingsTile(Icons.help, 'Help & Support', 'Get help'),
          _buildSettingsTile(
            Icons.info,
            'About',
            'App version 1.0.0',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.purple.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.purple),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }

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
          _buildFavoritesPage(),
          _buildSettingsPage(),
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
            widget: const Icon(Icons.star_outline),
            selectedWidget: const Icon(Icons.star),
            sfSymbol: 'star',
            selectedSfSymbol: 'star.fill',
            label: _labels[2],
          ),
          LiquidTabItem(
            widget: const Icon(Icons.settings_outlined),
            selectedWidget: const Icon(Icons.settings),
            sfSymbol: 'gearshape',
            selectedSfSymbol: 'gearshape.fill',
            label: _labels[3],
          ),
        ],
        showActionButton: true,
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
