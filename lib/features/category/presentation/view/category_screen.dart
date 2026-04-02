import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:finwise/core/widgets/loader.dart';
import 'package:finwise/features/category/domain/entities/transaction_entity.dart';
import 'package:finwise/features/category/presentation/view/category_view_screen.dart';
import 'package:finwise/features/category/presentation/view/savings_item_screen.dart';
import 'package:finwise/features/category/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finwise/features/category/domain/entities/category_entity.dart';
import 'package:finwise/core/constant/app_colors.dart';

import '../../../../core/widgets/app_toast.dart';
import '../riverpod/category_provider.dart';
import '../widgets/add_dialog_category.dart';
import '../widgets/icon_picker.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoryStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () => _openAddCategoryDialog(context),
            icon: Icon(Icons.add, size: 30, color: AppColors.textGreenColor),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.cyprusGreen,
      ),
      body: Column(
        children: [
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
              child: categoryState.when(
                loading: () => const Center(child: Loader()),
                error: (err, stack) => Center(child: Text('Error: $err')),
                data: (categories) {
                  if (categories.isEmpty) {
                    return _buildEmptyState();
                  }

                  final expenseList = categories
                      .where((c) => c.categoryType == CategoryType.expense)
                      .toList();
                  final savingsList = categories
                      .where((c) => c.categoryType == CategoryType.savings)
                      .toList();

                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // --- EXPENSE SECTION ---
                      if (expenseList.isNotEmpty) ...[
                        _buildSectionHeader("Expense"),
                        _buildCategoryGrid(expenseList),
                      ],

                      // --- SAVINGS SECTION ---
                      if (savingsList.isNotEmpty) ...[
                        _buildSectionHeader("Savings"),
                        _buildCategoryGrid(savingsList),
                      ],

                      const SliverToBoxAdapter(child: SizedBox(height: 40)),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Section Titles
  Widget _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 35, top: 30, bottom: 10),
        child: AppText(
          title,
          size: TextSize.xxl,
          weight: AppFontWeight.extraBold,
          color: AppColors.textGreenColor,
          textDecoration: TextDecoration.underline,
        ),
      ),
    );
  }

  // Helper for Responsive Grid
  Widget _buildCategoryGrid(List<CategoryEntity> list) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: .8,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final category = list[index];
          return CategoryCard(
            category: category,
            clickCategory: (context) => _navigateToCategoryView(category),
          );
        }, childCount: list.length),
      ),
    );
  }

  void _navigateToCategoryView(CategoryEntity category) {
    if (category.categoryType == CategoryType.expense) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryViewScreen(
            screenTitle: category.title,
            categoryId: category.categoryId,
            transactionType: TransactionType.expense,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SavingsItemScreen()),
      );
    }
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.add, size: 50, color: AppColors.textGreenColor),
            onPressed: () => _openAddCategoryDialog(context),
          ),
          AppText(
            "No categories found.",
            size: TextSize.xl,
            weight: AppFontWeight.bold,
          ),
        ],
      ),
    );
  }

  void _openAddCategoryDialog(BuildContext context) {
    showAddDialog(
      context,
      addIcon: () async => await pickIcon(context),
      onSaveCategory: (title, icon, categoryType) async {
        if (title.isEmpty) {
          AppToast.error(context, "Please enter a title");
          return;
        }
        try {
          final newCategory = CategoryEntity(
            categoryId: DateTime.now().millisecondsSinceEpoch.toString(),
            title: title,
            categoryType: categoryType,
            file: icon,
          );
          await ref
              .read(categoryStateProvider.notifier)
              .addCategory(newCategory);
          if (context.mounted) {
            Navigator.of(context).pop();
            AppToast.success(context, "Category saved!");
          }
        } catch (e) {
          AppToast.error(context, "Failed to save category.");
        }
      },
    );
  }
}
