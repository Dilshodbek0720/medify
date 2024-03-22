part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class CardNumber extends PaymentEvent{
  final String cardNumber;

  CardNumber({required this.cardNumber});
}

class AddCard extends PaymentEvent{
  AddCard();
}

class CardName extends PaymentEvent{
  final String cardName;

  CardName({required this.cardName});
}

class ExpireDate extends PaymentEvent{
  final String expireDate;

  ExpireDate({required this.expireDate});
}