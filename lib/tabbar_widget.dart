import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/colors_manager.dart';

import 'managers/snack_bar/snack_bar_manager.dart';
import 'modules/explore/view/explore_screen.dart';
import 'modules/favorite/view/favorite_screen.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _selectedIndex = 0;
  bool isStart = true;
  DateTime? currentBackPressTime;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> tabs = [
    const ExploreScreen(),
    const FavoriteScreen(),
  ];

  List<BottomNavigationBarItem> _navBarsItems() => [
        const BottomNavigationBarItem(
          label: 'Explore',
          icon: Icon(Icons.category_outlined),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v) {
        if (_selectedIndex == 0) {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) >
                  const Duration(seconds: 2)) {
            currentBackPressTime = now;
            SnackBarManager.showErrorMessage('please back again to close app');
          } else {
            SystemNavigator.pop();
          }
        } else {
          setState(() {
            _selectedIndex = 0;
          });
          _pageController.jumpToPage(0);
        }
      },
      child: Scaffold(
        extendBody: true,
        body: SizedBox.expand(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: tabs,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          selectedItemColor: ColorsManager.foundationMainWhite,
          unselectedItemColor: ColorsManager.foundationMainSecondary,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: _navBarsItems(),
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          backgroundColor: ColorsManager.foundationMainBlack,
        ),
      ),
    );
  }
}
