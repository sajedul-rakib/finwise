import 'package:finwise/features/category/domain/use_cases/add_transaction_use_case.dart';
import 'package:finwise/features/category/domain/use_cases/fetch_transaction_category_id_transaction_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/service/database/local_database_service.dart';
import '../../data/datasource/local/category_local_datasource.dart';
import '../../data/repository/category_repository_impl.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../../domain/use_cases/add_category_use_case.dart';
import '../../domain/use_cases/fetch_category_use_case.dart';
import 'category_notifier.dart';

// 1. Provide the Database Instance
final localDatabaseProvider = Provider((ref) => LocalDatabase.instance);

// 2. Provide the Datasource
final categoryLocalDatasourceProvider = Provider<CategoryLocalDatasource>((
  ref,
) {
  final dbService = ref.watch(localDatabaseProvider);
  return CategoryLocalDatasourceImpl(dbService);
});

// 3. Provide the Repository
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final datasource = ref.watch(categoryLocalDatasourceProvider);
  return CategoryRepositoryImpl(categoryLocalDatasource: datasource);
});

// 4. Provide the Use Cases
final addCategoryUseCaseProvider = Provider((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return AddCategoryUseCase(repository);
});

final addTransactionUseCaseProvider = Provider((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return AddTransactionUseCase(repository);
});

final fetchCategoriesUseCaseProvider = Provider((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return FetchCategoriesUseCase(repository);
});

final fetchTransactionUseCaseProvider = Provider((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return FetchTransactionCategoryIdTransactionTypeUseCase(repository);
});

// 5. THE STATE NOTIFIER (Manages UI State)
final categoryStateProvider =
    StateNotifierProvider<CategoryNotifier, AsyncValue<List<CategoryEntity>>>((
      ref,
    ) {
      return CategoryNotifier(
        fetchUseCase: ref.watch(fetchCategoriesUseCaseProvider),
        addUseCase: ref.watch(addCategoryUseCaseProvider),
      );
    });

final categoryProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  final fetchUseCase = ref.read(fetchCategoriesUseCaseProvider);
  return await fetchUseCase.execute();
});
