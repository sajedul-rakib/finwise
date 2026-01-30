import 'package:finwise/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../analysis/presentation/view/analysis_screen.dart';
import '../../../category/presentation/view/category_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../../../transactions/presentation/view/transactions_screen.dart';
import '../widgets/nav_item.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _selectedIndex = 0;

  void _changeIndex(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    AnalysisScreen(),
    TransactionsScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _screens[_selectedIndex],
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              onTap: _changeIndex,
              currentIndex: _selectedIndex,
              items: [
                BottomNavigationBarItem(
                  icon: NavItem(
                    imagePath: 'assets/images/icons/Home.png',
                    isSelected: _selectedIndex == 0,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: NavItem(
                    imagePath: 'assets/images/icons/analysis.png',
                    isSelected: _selectedIndex == 1,
                  ),
                  label: 'Analysis',
                ),
                BottomNavigationBarItem(
                  icon: NavItem(
                    imagePath: 'assets/images/icons/transactions.png',
                    isSelected: _selectedIndex == 2,
                  ),
                  label: 'Transactions',
                ),

                BottomNavigationBarItem(
                  icon: NavItem(
                    imagePath: 'assets/images/icons/category.png',
                    isSelected: _selectedIndex == 3,
                  ),
                  label: 'Category',
                ),

                BottomNavigationBarItem(
                  icon: NavItem(
                    imagePath: 'assets/images/icons/user_btm.png',
                    isSelected: _selectedIndex == 4,
                  ),
                  label: 'User',
                ),
              ],
              backgroundColor: AppColors.lightGreen,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ],
      ),
    );
  }
}
