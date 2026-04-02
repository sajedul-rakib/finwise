import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/use_cases/add_transaction_use_case.dart';
import 'category_provider.dart';

final transactionStateProvider =
    StateNotifierProvider<TransactionNotifier, AsyncValue<void>>((ref) {
      return TransactionNotifier(ref.read(addTransactionUseCaseProvider));
    });

class TransactionNotifier extends StateNotifier<AsyncValue<void>> {
  final AddTransactionUseCase _addUseCase;
  TransactionNotifier(this._addUseCase) : super(const AsyncValue.data(null));

  Future<void> saveTransaction(TransactionEntity transaction) async {
    state = const AsyncValue.loading();
    try {
      await _addUseCase.execute(transaction);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
