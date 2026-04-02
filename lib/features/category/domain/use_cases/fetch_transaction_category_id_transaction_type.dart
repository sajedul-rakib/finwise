import 'package:finwise/features/category/domain/entities/transaction_entity.dart';
import 'package:finwise/features/category/domain/repository/category_repository.dart';

class FetchTransactionCategoryIdTransactionTypeUseCase {
  final CategoryRepository repository;
  FetchTransactionCategoryIdTransactionTypeUseCase(this.repository);

  Future<List<TransactionEntity>> execute({
    required String categoryId,
    required TransactionType transactionType,
  }) async {
    return await repository.fetchTransactionByCategoryIdAndType(
      categoryId: categoryId,
      transactionType: transactionType,
    );
  }
}
