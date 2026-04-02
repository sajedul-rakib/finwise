import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/utils/get_time_of_day_greeting.dart';
import '../../../category/presentation/view/add_expense_screen.dart';
import '../../../notification/presentation/view/notification_screen.dart';
import '../../../profile/presentation/riverpod/profile_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String greeting = getTimeOfDayGreeting();

    return AppBar(
      centerTitle: false,
      backgroundColor: AppColors.caribbeanGreen,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Consumer(
            builder: (context, ref, _) {
              final controller = ref.watch(profileControllerProvider);
              return controller.when(
                data: (user) => AppText(
                  "Hi, ${user?.fullName}",
                  size: TextSize.xl,
                  weight: AppFontWeight.extraBold,
                  color: AppColors.fenceGreen,
                ),
                error: (err, str) => AppText(
                  "Hi, Welcome back!",
                  size: TextSize.lg,
                  weight: AppFontWeight.extraBold,
                  color: AppColors.fenceGreen,
                ),
                loading: () => _buildShimmerBox(width: 140, height: 22),
              );
            },
          ),
          AppText(
            greeting,
            size: TextSize.lg,
            weight: AppFontWeight.bold,
            fontFamily: GoogleFonts.leagueSpartan().fontFamily,
            color: AppColors.fenceGreen,
          ),
        ],
      ),
      actions: [
        // New Add Menu Button
        _buildAddMenu(context),
        _buildNotificationIcon(context),
      ],
    );
  }

  // SR DEV: Implementation of the Add Menu using PopupMenuButton
  Widget _buildAddMenu(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.lightGreen,
      onSelected: (value) {
        if (value == 'expense') {
          debugPrint("Navigate to Add Expense Screen");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );
        } else if (value == 'savings') {
          debugPrint("Navigate to Add Savings Screen");
          // Navigator.push(context, MaterialPageRoute(builder: (_) => const AddSavingsScreen()));
        }
      },
      offset: const Offset(0, 50), // Position the menu below the icon
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      icon: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightGreen,
        ),
        child: Icon(Icons.add, size: 20, color: AppColors.cyprusGreen),
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'expense',
          child: Row(
            children: [
              Icon(
                Icons.outbound_outlined,
                color: AppColors.errorColor,
                size: 20,
              ),
              const SizedBox(width: 10),
              const AppText(
                "Add Expense",
                size: TextSize.lg,
                weight: AppFontWeight.bold,
              ),
              Divider(),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'savings',
          child: Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.vividBlue,
                size: 20,
              ),
              const SizedBox(width: 10),
              const AppText(
                "Add Savings",
                size: TextSize.lg,
                weight: AppFontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerBox({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: AppColors.fenceGreen.withValues(alpha: 0.3),
      highlightColor: AppColors.fenceGreen.withValues(alpha: 0.1),
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationScreen()),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 20, left: 10),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightGreen,
        ),
        child: Icon(
          Icons.notifications_none,
          size: 18,
          color: AppColors.cyprusGreen,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
