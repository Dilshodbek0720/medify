class CreditCardModel{
  final String cardName;
  final String cardNumber;
  final String cardHolderName;
  final String expireDate;
  final bool cardVerified;
  final int verificationToken;
  final String id;

  CreditCardModel({
    required this.cardName,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expireDate,
    required this.cardVerified,
    required this.verificationToken,
    required this.id
  });

  CreditCardModel copyWith({
    String? cardName,
    String? cardNumber,
    String? cardHolderName,
    String? expireDate,
    bool? cardVerified,
    int? verificationToken,
    String? id
  }) =>
      CreditCardModel(
        cardName: cardName ?? this.cardName,
        cardNumber: cardNumber ?? this.cardNumber,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        expireDate: expireDate ?? this.expireDate,
        cardVerified: cardVerified ?? this.cardVerified,
        verificationToken: verificationToken ?? this.verificationToken,
        id: id ?? this.id
      );

  factory CreditCardModel.fromJson(Map<String, dynamic> json) => CreditCardModel(
    cardName: json["cardName"] as String? ?? "",
    cardNumber: json["cardNumber"] as String? ?? "",
    cardHolderName: json["cardHolderName"] as String? ?? "",
    expireDate: json["expireDate"] as String? ?? "",
    cardVerified: json["cardVerified"] as bool? ?? false,
    verificationToken: json["verification_token"] as int? ?? 0,
    id: json["_id"] as String? ?? "",
  );

  Map<String, dynamic> toJson(){
    return {
      "cardName":cardName,
      "cardNumber":cardNumber,
      "cardHolderName":cardHolderName,
      "expireDate":expireDate,
      "cardVerified":cardVerified,
      "verification_token":verificationToken,
      "_id":id
    };
  }
}