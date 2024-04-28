class FileModel {
  final String filename;
  final int size;
  final String lastModified;

  FileModel({
    required this.filename,
    required this.size,
    required this.lastModified,
  });

  FileModel copyWith({
    String? filename,
    int? size,
    String? lastModified,
  }) =>
      FileModel(
        filename: filename ?? this.filename,
        size: size ?? this.size,
        lastModified: lastModified ?? this.lastModified,
      );

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
    filename: json["filename"] as String? ?? '',
    size: json["size"] as int? ?? 0,
    lastModified: json["lastModified"] as String? ?? '',
  );

  Map<String, dynamic> toJson(){
    return {
      "filename":filename,
      "size":size,
      "lastModified":lastModified
    };
  }
}