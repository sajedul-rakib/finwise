import 'package:finwise/core/extension/string_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constant/app_colors.dart';
import '../../domain/entities/transaction_entity.dart';

class TransactionTileCard extends StatelessWidget {
  const TransactionTileCard({super.key, required this.transaction});

  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    // Logic to determine color and sign based on type
    final bool isExpense = transaction.type == TransactionType.expense;
    final Color amountColor = isExpense
        ? AppColors.oceanBlue
        : AppColors.fenceGreen;
    final String amountPrefix = isExpense ? '-' : '+';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Row(
            spacing: 10,
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.asset(
                  transaction.icon != null
                      ? 'assets/category-icons/${transaction.icon}'
                      : 'assets/category-icons/home.svg',
                  colorFilter: ColorFilter.mode(
                    AppColors.fenceGreen,
                    BlendMode.srcIn,
                  ),
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),

              // Title and Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    transaction.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.fenceGreen,
                    ),
                  ),
                  Text(
                    // Using your existing extension logic
                    transaction.createdAt.toString().formatDate(
                      transaction.createdAt.toString(),
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.oceanBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Amount Section
        Text(
          '$amountPrefix\$${transaction.amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: amountColor,
          ),
        ),
      ],
    );
  }
}
