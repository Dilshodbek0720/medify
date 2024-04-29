part of 'card_code_input_cubit.dart';

abstract class CardCodeInputState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CardCodeInputInitial extends CardCodeInputState {}

class CardCodeInputCountdown extends CardCodeInputState {
  final int remainingTime;

  CardCodeInputCountdown(this.remainingTime);

  @override
  List<Object?> get props => [remainingTime];
}