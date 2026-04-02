import 'package:finwise/features/category/domain/entities/category_entity.dart';
import 'package:finwise/features/category/domain/repository/category_repository.dart';

class AddCategoryUseCase {
  final CategoryRepository _repository;

  AddCategoryUseCase(this._repository);

  Future<void> execute(CategoryEntity category) async {
    return await _repository.addNewCategory(categoryEntity: category);
  }
}
