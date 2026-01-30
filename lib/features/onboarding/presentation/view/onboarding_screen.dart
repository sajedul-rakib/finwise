import 'package:finwise/features/onboarding/presentation/widgets/page.dart';
import 'package:finwise/features/splash/presentation/view/auth_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _changeIndex() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              OnboardingPage(
                description: "Welcome to Expense Manager",
                imagePath: "assets/images/coin.png",
                onPressed: () {
                  _tabController.animateTo(1);
                },
              ),
              OnboardingPage(
                description: "¿Are you ready to take control of your finances?",
                imagePath: "assets/images/mobile.png",
                onPressed: () {
                  _tabController.animateTo(0);
                },
              ),
            ],
          ),
          //add two dots
          Positioned(
            bottom: 50,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    _tabController.index == _tabController.length - 1
                        ? Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(),
                            ),
                            (route) => false,
                          )
                        : _changeIndex();
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cyprusGreen,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    for (int i = 0; i < _tabController.length; i++)
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: !(_tabController.index == i)
                              ? Border.all(
                                  color: AppColors.cyprusGreen,
                                  width: 2,
                                )
                              : null,
                          color: _tabController.index == i
                              ? AppColors.caribbeanGreen
                              : null,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
