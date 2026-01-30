class ScreenItemModel {
  final String id;
  final String title;
  final String icon;

  ScreenItemModel({required this.id, required this.title, required this.icon});

  factory ScreenItemModel.fromJson(Map<String, dynamic> json) {
    return ScreenItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
    );
  }
}
