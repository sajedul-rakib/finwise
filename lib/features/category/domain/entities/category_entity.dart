enum CategoryType { expense, savings }

class CategoryEntity {
  String title;
  String categoryId;
  String file;
  CategoryType categoryType;

  CategoryEntity({
    required this.categoryId,
    required this.title,
    required this.file,
    required this.categoryType,
  });
}
