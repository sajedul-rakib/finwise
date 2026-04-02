import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:finwise/core/widgets/loader.dart';
import 'package:finwise/core/widgets/transactions_stats.dart';
import 'package:finwise/features/category/domain/entities/transaction_entity.dart';
import 'package:finwise/features/category/presentation/view/add_expense_screen.dart';
import 'package:finwise/features/category/presentation/widgets/transaction_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_colors.dart';
import '../riverpod/fetch_transactions_category_id_transaction_type_notifier.dart';

class CategoryViewScreen extends ConsumerStatefulWidget {
  final String categoryId;
  final TransactionType transactionType;
  final String screenTitle;

  const CategoryViewScreen({
    super.key,
    required this.screenTitle,
    required this.categoryId,
    required this.transactionType,
  });

  @override
  ConsumerState<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends ConsumerState<CategoryViewScreen> {
  late final _providerParams = (
    categoryId: widget.categoryId,
    type: widget.transactionType,
  );

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(transactionListProvider(_providerParams).notifier)
          .loadTransactionData(
            categoryId: widget.categoryId,
            transactionType: widget.transactionType,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch specifically for this category's data
    final transactionsAsync = ref.watch(
      transactionListProvider(_providerParams),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.screenTitle)),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: TransactionsStats(),
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
                    child: transactionsAsync.when(
                      data: (transactions) => transactions.isEmpty
                          ? Center(
                              child: AppText(
                                "No Transaction Found!",
                                size: TextSize.xl,
                                weight: AppFontWeight.bold,
                                color: AppColors.textGreenColor,
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.all(30),
                              itemCount: transactions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  // Pass the model directly from the list
                                  child: TransactionTileCard(
                                    transaction: transactions[index],
                                  ),
                                );
                              },
                            ),
                      error: (err, st) => Center(
                        child: AppText(
                          err.toString(),
                          size: TextSize.lg,
                          color: AppColors.errorColor,
                          weight: AppFontWeight.bold,
                        ),
                      ),
                      loading: () => const Loader(),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AppButton(
                        title: "Add Expense",
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textGreenColor,
                        ),
                        onPressed: () async {
                          // Wait for user to return, THEN invalidate to refresh list
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AddExpenseScreen(),
                            ),
                          );
                          ref.invalidate(
                            transactionListProvider(_providerParams),
                          );
                        },
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
