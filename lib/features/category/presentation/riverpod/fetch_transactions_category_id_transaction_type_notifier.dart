import 'package:finwise/features/category/domain/entities/transaction_entity.dart';
import 'package:finwise/features/category/domain/use_cases/fetch_transaction_category_id_transaction_type.dart';
import 'package:finwise/features/category/presentation/riverpod/category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionListProvider =
    StateNotifierProvider.family<
      FetchTransactionsCategoryIdTransactionTypeNotifier,
      AsyncValue<List<TransactionEntity>>,
      ({String categoryId, TransactionType type}) // Record for multiple params
    >((ref, params) {
      final useCase = ref.read(fetchTransactionUseCaseProvider);
      return FetchTransactionsCategoryIdTransactionTypeNotifier(
        useCase: useCase,
        initialCategoryId: params.categoryId,
        initialType: params.type,
      );
    });

class FetchTransactionsCategoryIdTransactionTypeNotifier
    extends StateNotifier<AsyncValue<List<TransactionEntity>>> {
  final FetchTransactionCategoryIdTransactionTypeUseCase _useCase;

  FetchTransactionsCategoryIdTransactionTypeNotifier({
    required FetchTransactionCategoryIdTransactionTypeUseCase useCase,
    required String initialCategoryId,
    required TransactionType initialType,
  }) : _useCase = useCase,
       super(const AsyncValue.loading()) {
    // Automatically load data on initialization
    loadTransactionData(
      categoryId: initialCategoryId,
      transactionType: initialType,
    );
  }

  Future<void> loadTransactionData({
    required String categoryId,
    required TransactionType transactionType,
  }) async {
    state = const AsyncValue.loading(); // Correct state assignment
    try {
      final result = await _useCase.execute(
        categoryId: categoryId,
        transactionType: transactionType,
      );
      state = AsyncValue.data(result); // Update state with result
    } catch (e, st) {
      state = AsyncValue.error(e, st); // Update state with error
    }
  }
}
