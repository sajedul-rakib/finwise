import 'package:finwise/features/category/domain/entities/category_entity.dart';
import 'package:finwise/features/category/domain/entities/transaction_entity.dart';

abstract interface class CategoryRepository {
  //category related methods
  Future<void> addNewCategory({required CategoryEntity categoryEntity});
  Future<List<CategoryEntity>> fetchCategories();
  Future<List<CategoryEntity>> fetchCategoriesByType(CategoryType categoryType);

  //transaction related methods
  Future<void> addTransaction(TransactionEntity transactionEntity);
  Future<List<TransactionEntity>> fetchTransactionByCategoryIdAndType({
    required String categoryId,
    required TransactionType transactionType,
  });
}
