import 'package:finwise/core/development/logger/error_logger.dart';
import 'package:finwise/features/category/domain/entities/transaction_entity.dart';
import '../../../../../core/service/database/local_database_service.dart';
import '../../../domain/entities/category_entity.dart';
import '../../model/category_model.dart';
import '../../model/transactions_model.dart';

abstract interface class CategoryLocalDatasource {
  Future<void> saveCategory(CategoryModel category);
  Future<List<CategoryModel>> fetchAllCategories();
  Future<void> saveTransaction(TransactionModel transaction);
  Future<List<Map<String, dynamic>>> fetchAllTransactions();
  Future<List<CategoryModel>> fetchCategoriesByType(CategoryType type);

  Future<List<TransactionModel>> fetchExpenseTransactionByCategoryId(
    String categoryId,
    TransactionType transactionType,
  );
}

class CategoryLocalDatasourceImpl implements CategoryLocalDatasource {
  final LocalDatabase _dbService;
  final String _tableName = 'categories';

  CategoryLocalDatasourceImpl(this._dbService);

  @override
  Future<void> saveCategory(CategoryModel category) async {
    try {
      // Perform the insert operation using the model's toMap()
      await _dbService.insert(_tableName, category.toMap());

      // Success log
      errorLogger(
        where: "Category Local DataBase",
        whichPlace: 'saveCategory',
        extraMessage: "Successfully saved category: ${category.title}",
      );
    } catch (e) {
      // Error log
      errorLogger(
        where: "Category Local DataBase",
        whichPlace: 'inside save category function',
        extraMessage: "Failed to save ${category.title}: ${e.toString()}",
      );
      rethrow; // Re-throw to let the Repository/Provider handle the failure
    }
  }

  @override
  Future<List<CategoryModel>> fetchAllCategories() async {
    try {
      final List<Map<String, dynamic>> result = await _dbService.queryAll(
        _tableName,
      );

      // Map the database rows into CategoryModel instances
      return result.map((json) => CategoryModel.fromMap(json)).toList();
    } catch (e, _) {
      errorLogger(
        where: "Category Local DataBase",
        whichPlace: 'fetchAllCategories',
        extraMessage: e.toString(),
      );
      rethrow; // Return an empty list if fetching fails
    }
  }

  // Inside CategoryLocalDatasourceImpl
  @override
  Future<List<CategoryModel>> fetchCategoriesByType(CategoryType type) async {
    try {
      // We query the database with a WHERE clause
      final List<Map<String, dynamic>> result = await _dbService.query(
        _tableName,
        where: 'type = ?',
        whereArgs: [type.name], // 'expense' or 'savings'
      );

      return result.map((json) => CategoryModel.fromMap(json)).toList();
    } catch (e) {
      errorLogger(
        where: "DB",
        whichPlace: "fetchByType",
        extraMessage: e.toString(),
      );
      rethrow;
    }
  }

  final String _transactionTableName = 'transactions';

  @override
  Future<void> saveTransaction(TransactionModel transaction) async {
    try {
      final updateMap = {
        'id': transaction.id,
        'title': transaction.title,
        'amount': transaction.amount,
        'categoryId': transaction.categoryId,
        'type': transaction.type.name,
        'createdAt': transaction.createdAt.toIso8601String(),
        'updatedAt': transaction.updatedAt.toIso8601String(),
      };
      await _dbService.insert(_transactionTableName, updateMap);

      errorLogger(
        where: "Transaction Local DB",
        whichPlace: 'saveTransaction',
        extraMessage: "Successfully saved: ${transaction.title}",
      );
    } catch (e) {
      errorLogger(
        where: "Transaction Local DB",
        whichPlace: 'saveTransaction Error',
        extraMessage: e.toString(),
      );
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchAllTransactions() async {
    try {
      return await _dbService.queryAll(_transactionTableName);
    } catch (e) {
      errorLogger(
        where: "Transaction Local DB",
        whichPlace: 'fetchAllTransactions',
        extraMessage: e.toString(),
      );
      rethrow;
    }
  }

  @override
  Future<List<TransactionModel>> fetchExpenseTransactionByCategoryId(
    String categoryId,
    TransactionType transactionType,
  ) async {
    final response = await _dbService.transactionQueryByCategoryIdAndType(
      categoryId: categoryId,
      transactionType: transactionType.name,
    );
    return response.map((val) => TransactionModel.fromLocalMap(val)).toList();
  }
}
