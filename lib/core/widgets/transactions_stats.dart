import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../extension/text_style_extension.dart';
import 'app_text_widget.dart';
import 'image_viewer.dart';

class TransactionsStats extends StatelessWidget {
  const TransactionsStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Balance Column
            _buildStatColumn(
              label: "Total Balance",
              amount: '\$7,783.00',
              amountColor: AppColors.honeydewGreen,
              icon: Icons.arrow_upward,
            ),

            const ImageViewer(imagePath: 'assets/images/icons/line.png'),

            // Expense Column
            _buildStatColumn(
              label: "Total Expense",
              amount: '-\$7,783.00',
              amountColor: AppColors.oceanBlue,
              icon: Icons.arrow_downward,
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildProgressSection(),
      ],
    );
  }

  Widget _buildStatColumn({
    required String label,
    required String amount,
    required Color amountColor,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Row(
          spacing: 5,
          children: [
            _buildIconBox(icon: icon, boxSize: 12, iconSize: 10),
            AppText(
              label,
              size: TextSize.sm,
              weight: AppFontWeight.regular,
              color: AppColors.textGreenColor,
            ),
          ],
        ),
        AppText(
          amount,
          size: TextSize.xxxl,
          weight: AppFontWeight.extraBold,
          color: amountColor,
        ),
      ],
    );
  }

  Widget _buildIconBox({
    required IconData icon,
    required double boxSize,
    required double iconSize,
  }) {
    return Container(
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: AppColors.cyprusGreen, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon, size: iconSize, color: AppColors.cyprusGreen),
    );
  }

  Widget _buildProgressSection() {
    return Column(
      children: [
        LinearProgressIndicator(
          value: 0.3,
          backgroundColor: AppColors.cyprusGreen,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.honeydewGreen),
          minHeight: 20,
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 5,
          children: [
            _buildIconBox(icon: Icons.check, boxSize: 15, iconSize: 12),
            AppText(
              '30% of your expenses, looks good.',
              size: TextSize.xl,
              weight: AppFontWeight.regular,
              color: AppColors.cyprusGreen,
            ),
          ],
        ),
      ],
    );
  }
}
