class RecipeModel {
  final int? id; // 👈 JADI OPSIONAL
  final String title;
  final String category;
  final String duration;
  final String imageUrl;

  RecipeModel({
    this.id, // 👈 tidak required
    required this.title,
    required this.category,
    required this.duration,
    required this.imageUrl,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      duration: json['duration'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'duration': duration,
      'image_url': imageUrl,
    };
  }
}
