import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/features/category/presentation/view/add_expense_screen.dart';
import 'package:finwise/features/category/presentation/view/savings_screen.dart';
import 'package:finwise/features/category/presentation/widgets/expense_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../../data/model/category_card_model.dart';
import '../widgets/add_dialog_category.dart';

class CategoryViewScreen extends StatelessWidget {
  const CategoryViewScreen({
    super.key,
    required this.screenTitle,
    required this.categoryCardModel,
  });

  final String screenTitle;
  final CategoryCardModel categoryCardModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenTitle)),
      body: Column(
        children: [
          // Top Stats Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatItem(
                      label: "Total Balance",
                      amount: "\$${categoryCardModel.totalBalance}",
                      icon: Icons.arrow_upward,
                      amountColor: AppColors.honeydewGreen,
                    ),
                    const ImageViewer(
                      imagePath: 'assets/images/icons/line.png',
                    ),
                    _buildStatItem(
                      label: "Total Expense",
                      amount: "-\$${categoryCardModel.totalExpense}",
                      icon: Icons.arrow_downward,
                      amountColor: AppColors.oceanBlue,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: AppColors.cyprusGreen,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.honeydewGreen,
                      ),
                      minHeight: 20,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.cyprusGreen),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 12,
                            color: AppColors.cyprusGreen,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '30% of your expenses, looks good.',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.cyprusGreen,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(30),
                      itemCount: categoryCardModel.transactionItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ExpenseCard(
                            icon: categoryCardModel.icon,
                            savingsTitle:
                                categoryCardModel.transactionItems[index].title,
                            createAt: categoryCardModel
                                .transactionItems[index]
                                .timestamp,
                            savingsAmount:
                                '${categoryCardModel.transactionItems[index].amount}',
                          ),
                        );
                      },
                    ),
                  ),
                  SafeArea(
                    child: AppButton(
                      title: "Add Expense",
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGreenColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddExpenseScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String amount,
    required IconData icon,
    required Color amountColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.cyprusGreen),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(icon, size: 10, color: AppColors.cyprusGreen),
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: AppColors.textGreenColor),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          amount,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: amountColor,
          ),
        ),
      ],
    );
  }

  void clickCategory(BuildContext context, String id) {
    switch (id) {
      case "add":
        showAddDialog(context);
      case "savings":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SavingsScreen()),
        );
        break;
    }
  }
}
