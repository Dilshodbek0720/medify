class MessageModel {
  final String receiverName;
  final String senderName;
  final String dateTime;
  final List<String>? image;
  final String? message;
  final String? folder;
  final String? voice;

  MessageModel({
    required this.receiverName,
    required this.senderName,
    required this.dateTime,
    this.image,
    this.message,
    this.folder,
    this.voice,
  });

  Map<String, dynamic> toJson() {
    return {
      'receiverName': receiverName,
      'senderName': senderName,
      'dateTime': dateTime,
      'image': image,
      'message': message,
      'folder': folder,
      'voice': voice,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      receiverName: json['receiverName'],
      senderName: json['senderName'],
      dateTime: json['dateTime'],
      image: json['image'],
      message: json['message'],
      folder: json['folder'],
      voice: json['voice'],
    );
  }
}
