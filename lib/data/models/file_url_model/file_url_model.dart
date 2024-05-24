class FileUrlModel {
  final String filename;
  final String fileUrl;

  FileUrlModel({
    required this.filename,
    required this.fileUrl,
  });

  FileUrlModel copyWith({
    String? filename,
    String? fileUrl,
  }) =>
      FileUrlModel(
        filename: filename ?? this.filename,
        fileUrl: fileUrl ?? this.fileUrl,
      );

  factory FileUrlModel.fromJson(Map<String, dynamic> json) => FileUrlModel(
    filename: json["file_name"] as String? ?? '',
    fileUrl: json["file_url"] as String? ?? '',
  );

  Map<String, dynamic> toJson(){
    return {
      "file_name":filename,
      "file_url":fileUrl
    };
  }
}