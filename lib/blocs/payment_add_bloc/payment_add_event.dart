part of 'payment_add_bloc.dart';

@immutable
abstract class PaymentAddEvent {}

class AddCards extends PaymentAddEvent{

  AddCards();
}
class GetCards extends PaymentAddEvent{}