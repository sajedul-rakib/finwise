import 'dart:developer';

import 'package:finwise/features/category/domain/entities/transaction_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../datasource/local/category_local_datasource.dart';
import '../model/category_model.dart';
import '../model/transactions_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDatasource _categoryLocalDatasource;

  CategoryRepositoryImpl({
    required CategoryLocalDatasource categoryLocalDatasource,
  }) : _categoryLocalDatasource = categoryLocalDatasource;

  @override
  Future<void> addNewCategory({required CategoryEntity categoryEntity}) async {
    final model = CategoryModel.fromEntity(categoryEntity);
    return await _categoryLocalDatasource.saveCategory(model);
  }

  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    final models = await _categoryLocalDatasource.fetchAllCategories();

    final expenseCategory = models.where((vale) {
      return vale.categoryType == CategoryType.expense;
    });

    final savingsCategory = models.where((vale) {
      return vale.categoryType == CategoryType.savings;
    });

    log(
      "The expense category is ${expenseCategory} and savings category is ${savingsCategory}",
    );

    return models
        .map(
          (model) => CategoryEntity(
            categoryType: model.categoryType,
            categoryId: model.id,
            title: model.title,
            file: model.icon,
          ),
        )
        .toList();
  }

  @override
  Future<void> addTransaction(TransactionEntity transaction) async {
    final model = TransactionModel.fromEntity(transaction);
    await _categoryLocalDatasource.saveTransaction(model);
  }

  @override
  Future<List<CategoryEntity>> fetchCategoriesByType(
    CategoryType categoryType,
  ) async {
    final res = await _categoryLocalDatasource.fetchCategoriesByType(
      categoryType,
    );

    return res
        .map(
          (r) => CategoryEntity(
            categoryId: r.id,
            title: r.title,
            file: r.icon,
            categoryType: r.categoryType,
          ),
        )
        .toList();
  }

  @override
  Future<List<TransactionEntity>> fetchTransactionByCategoryIdAndType({
    required String categoryId,
    required TransactionType transactionType,
  }) async {
    final result = await _categoryLocalDatasource
        .fetchExpenseTransactionByCategoryId(categoryId, transactionType);

    return result
        .map(
          (res) => TransactionEntity(
            id: res.id,
            title: res.title,
            amount: res.amount,
            categoryId: res.categoryId,
            type: res.type,
            icon: res.icon,
            createdAt: res.createdAt,
            updatedAt: res.updatedAt,
          ),
        )
        .toList();
  }
}
