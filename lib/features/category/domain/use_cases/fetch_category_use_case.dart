import '../entities/category_entity.dart';
import '../repository/category_repository.dart';

class FetchCategoriesUseCase {
  final CategoryRepository _repository;

  FetchCategoriesUseCase(this._repository);

  Future<List<CategoryEntity>> execute() async {
    return await _repository.fetchCategories();
  }

  Future<List<CategoryEntity>> fetchByType(CategoryType categoryType) async {
    return await _repository.fetchCategoriesByType(categoryType);
  }
}
