import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/use_cases/add_category_use_case.dart';
import '../../domain/use_cases/fetch_category_use_case.dart';

class CategoryNotifier extends StateNotifier<AsyncValue<List<CategoryEntity>>> {
  final FetchCategoriesUseCase _fetchUseCase;
  final AddCategoryUseCase _addUseCase;

  CategoryNotifier({
    required FetchCategoriesUseCase fetchUseCase,
    required AddCategoryUseCase addUseCase,
  }) : _fetchUseCase = fetchUseCase,
       _addUseCase = addUseCase,
       super(const AsyncValue.loading()) {
    loadCategories();
  }

  Future<void> loadCategories() async {
    state = const AsyncValue.loading();
    try {
      final categories = await _fetchUseCase.execute();
      state = AsyncValue.data(categories);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addCategory(CategoryEntity category) async {
    try {
      await _addUseCase.execute(category);
      await loadCategories(); // Refresh the list after adding
    } catch (e) {
      // Handle error (e.g., show AppToast.error)
    }
  }
}
