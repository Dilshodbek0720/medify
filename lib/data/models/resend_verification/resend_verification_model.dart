class ResendVerificationModel{
  final String userId;
  final String email;
  final int iat;
  final int exp;
  ResendVerificationModel(
  {
    required this.email,
    required this.userId,
    required this.exp,
    required this.iat,
}
      );

  ResendVerificationModel copyWith({
    String? email,
    String? userId,
    int? iat,
    int? exp,
  }) =>
      ResendVerificationModel(
        email: email ?? this.email,
        userId: userId ?? this.userId,
        iat: iat ?? this.iat,
        exp: exp ?? this.exp,
      );

  factory ResendVerificationModel.fromJson(Map<String, dynamic> json) => ResendVerificationModel(
    email: json["email"] as String? ?? "",
    userId: json["userId"] as String? ?? "",
    iat: json["iat"] as int? ?? 0,
    exp: json["exp"] as int? ?? 0,
  );

}