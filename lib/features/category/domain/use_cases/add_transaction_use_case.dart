import '../entities/transaction_entity.dart';
import '../repository/category_repository.dart';

class AddTransactionUseCase {
  final CategoryRepository repository;
  AddTransactionUseCase(this.repository);

  Future<void> execute(TransactionEntity transaction) async {
    return await repository.addTransaction(transaction);
  }
}
