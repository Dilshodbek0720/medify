class CreditCardModel{
  final String cardName;
  final String cardNumber;
  final String cardHolderName;
  final String expireDate;


  CreditCardModel({
    required this.cardName,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expireDate,
  });

  CreditCardModel copyWith({
    String? cardName,
    String? cardNumber,
    String? cardHolderName,
    String? expireDate,
  }) =>
      CreditCardModel(
        cardName: cardName ?? this.cardName,
        cardNumber: cardNumber ?? this.cardNumber,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        expireDate: expireDate ?? this.expireDate,

      );

  factory CreditCardModel.fromJson(Map<String, dynamic> json) => CreditCardModel(
    cardName: json["cardName"] as String? ?? "",
    cardNumber: json["cardNumber"] as String? ?? "",
    cardHolderName: json["cardHolderName"] as String? ?? "",
    expireDate: json["expireDate"] as String? ?? "",
  );

  Map<String, dynamic> toJson(){
    return {
      "cardName":cardName,
      "cardNumber":cardNumber,
      "cardHolderName":cardHolderName,
      "expireDate":expireDate
    };
  }
}