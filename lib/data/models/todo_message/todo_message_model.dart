class TodoMessageModel {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String startDateTime;
  final String endDateTime;

  TodoMessageModel({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.startDateTime,
    required this.endDateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'startDate': startDate,
      'endDate': endDate,
      'startDateTime': startDateTime,
      'endDateTime': endDateTime,
    };
  }

  factory TodoMessageModel.fromJson(Map<String, dynamic> json) {
    return TodoMessageModel(
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      startDateTime: json['startDateTime'],
      endDateTime: json['endDateTime'],
    );
  }
}
