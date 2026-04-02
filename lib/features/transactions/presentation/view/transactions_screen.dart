import 'package:finwise/features/category/domain/entities/transaction_entity.dart';
import 'package:finwise/features/category/presentation/widgets/transaction_tile_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../widgets/month_view_text.dart';
import '../widgets/stats_container.dart';
import '../widgets/transaction_container.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transaction")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                StatsContainer(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TransactionContainer(
                      imagePath: 'assets/images/icons/up_arrow.png',
                      title: 'Income',
                      amount: '2120.00',
                    ),
                    TransactionContainer(
                      imagePath: 'assets/images/icons/down-arrow.png',
                      title: 'Expense',
                      amount: '1187.20',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.caribbeanGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_month,
                            size: 20,
                            color: AppColors.textGreenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          MonthViewText(monthName: 'April'),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          MonthViewText(monthName: 'March'),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          MonthViewText(monthName: 'February'),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                          TransactionTileCard(
                            transaction: TransactionEntity(
                              id: 'adf',
                              title: "Salary",
                              amount: 1290,
                              categoryId: 'categoryId',
                              type: TransactionType.savings,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ),
                          ),
                        ],
                      ),
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
