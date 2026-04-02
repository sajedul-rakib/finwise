import 'package:finwise/features/category/domain/entities/category_entity.dart';

class CategoryModel {
  final String id;
  final String title;
  final String icon;
  final CategoryType categoryType;

  CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.categoryType,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'icon': icon, 'type': categoryType.name};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      title: map['title'],
      icon: map['icon'],
      categoryType: CategoryType.values.byName(map['type']),
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.categoryId,
      title: entity.title,
      icon: entity.file,
      categoryType: entity.categoryType,
    );
  }
}
