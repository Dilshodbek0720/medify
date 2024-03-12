class UniversalData {
  UniversalData({
    this.data,
    this.error = "",
    this.token = "",
    this.statusCode = 0,
  });

  dynamic data;
  String error;
  String token;
  int statusCode;
}
