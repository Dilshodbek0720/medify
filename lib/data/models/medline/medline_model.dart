class MedlineModel {
  final int id;
  final String title;
  final String author;
  final String description;

  MedlineModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
  });

  MedlineModel copyWith({
    int? id,
    String? title,
    String? author,
    String? description,
  }) =>
      MedlineModel(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        description: description ?? this.description,
      );

  factory MedlineModel.fromJson(Map<String, dynamic> json) => MedlineModel(
    id: json["id"] as int? ?? 0,
    title: json["title"] as String? ?? "",
    author: json["author"] as String? ?? "",
    description: json["description"] as String? ?? "",
  );
}