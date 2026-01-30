class SocialLinkModel {
  final String id;
  final String title;
  final String icon;

  SocialLinkModel({required this.id, required this.title, required this.icon});

  factory SocialLinkModel.fromJson(Map<String, dynamic> json) {
    return SocialLinkModel(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
    );
  }
}
