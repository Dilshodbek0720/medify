import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/credit_card/credit_card.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/repository/payment_repository.dart';
import 'package:medify/utils/constants/storage_keys.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(this.paymentRepository) : super(const PaymentState(cardNumber: "", cardName: "", expireDate: "")) {
    on<CardNumber>(updateCardNumber);
    on<CardName>(updateCardName);
    on<ExpireDate>(updateExpireDate);
    on<AddCard>(addCards);
  }

  final PaymentRepository paymentRepository;

  void updateCardNumber(CardNumber event, Emitter<PaymentState> emit) {
    emit(state.copyWith(cardNumber: event.cardNumber));
  }

  void updateCardName(CardName event, Emitter<PaymentState> emit) {
    emit(state.copyWith(cardName: event.cardName));
  }

  void updateExpireDate(ExpireDate event, Emitter<PaymentState> emit) {
    emit(state.copyWith(expireDate: event.expireDate));
  }

  void addCards(AddCard event, Emitter<PaymentState> emit) async{
    UniversalData data = await paymentRepository.createCreditCard(
      token: StorageRepository.getString(StorageKeys.userToken),
      creditCardModel: CreditCardModel(
          cardName: state.cardName,
          cardNumber: state.cardNumber,
          cardHolderName: "Dilshodbek Sayitqulov",
          expireDate: state.expireDate),
    );
    print(data.data);
    emit(state);
  }
}

bool isUzCardOrHumoCard(String cardNumber) {
  cardNumber.replaceAll(RegExp(r'[ -]'), '');

  if (cardNumber.length != 16) {
    return false; // Card number must have 16 digits
  }

  if (cardNumber.startsWith('8600') || cardNumber.startsWith('9860')) {
    return true; // It's an UzCard
  }

  if (cardNumber.startsWith('9860')) {
    return true; // It's a Humo card
  }
  return false;
}