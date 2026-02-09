import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:finwise/features/category/data/model/category_card_model.dart';
import 'package:finwise/features/category/presentation/view/add_savings.dart';
import 'package:finwise/features/category/presentation/widgets/savings_card.dart';
import 'package:finwise/features/category/presentation/widgets/savings_target_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class SavingsItemScreen extends StatelessWidget {
  const SavingsItemScreen({
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.fenceGreen,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.lightGreen,
                                    ),
                                    child: ImageViewer(
                                      imagePath:
                                          'assets/images/icons/up_arrow.png',
                                      fit: BoxFit.contain,
                                      color: AppColors.fenceGreen,
                                    ),
                                  ),
                                  Text(
                                    "Goal",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textGreenColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  Text(
                                    "\$${categoryCardModel.savings.goal.toString()}",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.fenceGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.fenceGreen,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.lightGreen,
                                    ),
                                    child: Transform.rotate(
                                      angle: 180 * 3.1416 / 360,
                                      child: ImageViewer(
                                        imagePath:
                                            'assets/images/icons/up_arrow.png',
                                        fit: BoxFit.contain,
                                        color: AppColors.fenceGreen,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Amount Saved",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textGreenColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  Text(
                                    "\$${categoryCardModel.savings.savings.toString()}",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.caribbeanGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SavingsTargetCard(
                        targetName: categoryCardModel.title,
                        targetProgress: categoryCardModel.savings.progress,
                        icon: categoryCardModel.icon,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      LinearProgressIndicator(
                        value: 0.3,
                        backgroundColor: AppColors.caribbeanGreen,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.fenceGreen,
                        ),
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
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: AppColors.cyprusGreen,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.check,
                              size: 12,
                              color: AppColors.cyprusGreen,
                            ),
                          ),
                          Text(
                            '30% of your expenses, looks good.',

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: AppColors.cyprusGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                categoryCardModel.transactionItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: SavingsCard(
                                  icon: categoryCardModel.icon,
                                  savingsTitle: categoryCardModel
                                      .transactionItems[index]
                                      .title,
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
                            title: "Add Savings",
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textGreenColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddSavings(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
