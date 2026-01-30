import 'package:finwise/features/transactions/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'April',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textGreenColor,
                        ),
                      ),

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
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TransactionCard(),
                          TransactionCard(),
                          TransactionCard(),
                          Text(
                            'March',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textGreenColor,
                            ),
                          ),
                          TransactionCard(),
                          TransactionCard(),
                          TransactionCard(),
                          Text(
                            'February',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textGreenColor,
                            ),
                          ),
                          TransactionCard(),
                          TransactionCard(),
                          TransactionCard(),
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
