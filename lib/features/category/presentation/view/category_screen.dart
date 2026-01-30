import 'package:finwise/features/category/presentation/view/savings_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../../data/datasource/category_data.dart';
import '../../data/model/category_card_model.dart';
import '../widgets/add_dialog_category.dart';
import '../widgets/category_card.dart';
import 'category_view_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.cyprusGreen,
      ),
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
                      amount: "\$7,783.00",
                      icon: Icons.arrow_upward,
                      amountColor: AppColors.honeydewGreen,
                    ),
                    const ImageViewer(
                      imagePath: 'assets/images/icons/line.png',
                    ),
                    _buildStatItem(
                      label: "Total Expense",
                      amount: "-\$7,783.00",
                      icon: Icons.arrow_downward,
                      amountColor: AppColors.oceanBlue,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Progress Bar Section
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

          // Scrollable Grid Section
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
              child: GridView.builder(
                padding: const EdgeInsets.all(30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                  childAspectRatio: .8,
                ),
                itemCount: CategoryData.categories.length,
                itemBuilder: (context, index) {
                  final category = CategoryCardModel.fromJson(
                    CategoryData.categories[index],
                  );
                  return CategoryCard(
                    category: category,
                    clickCategory: (BuildContext context) {
                      clickCategory(context, category.id, category);
                    },
                  );
                },
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

  void clickCategory(
    BuildContext context,
    String id,
    CategoryCardModel categoryCardModel,
  ) {
    switch (id) {
      case "add":
        showAddDialog(context);
      case "savings":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SavingsScreen()),
        );
        break;
      default:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryViewScreen(
              screenTitle: categoryCardModel.title,
              categoryCardModel: categoryCardModel,
            ),
          ),
        );
    }
  }
}
