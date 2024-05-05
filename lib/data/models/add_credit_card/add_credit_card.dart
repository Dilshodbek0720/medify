class AddCreditCardModel{
  final String cardName;
  final String cardNumber;
  final String cardHolderName;
  final String expireDate;


  AddCreditCardModel({
    required this.cardName,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expireDate,
  });

  AddCreditCardModel copyWith({
    String? cardName,
    String? cardNumber,
    String? cardHolderName,
    String? expireDate,
  }) =>
      AddCreditCardModel(
        cardName: cardName ?? this.cardName,
        cardNumber: cardNumber ?? this.cardNumber,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        expireDate: expireDate ?? this.expireDate,
      );

  factory AddCreditCardModel.fromJson(Map<String, dynamic> json) => AddCreditCardModel(
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