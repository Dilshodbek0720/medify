import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'card_code_input_state.dart';

class CardCodeInputCubit extends Cubit<CardCodeInputState> {
  final List<FocusNode> pinFocusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> pinControllers =
  List.generate(6, (_) => TextEditingController());

  int remainingTime = 180;
  Timer? _countdownTimer;
  BuildContext? _context;

  CardCodeInputCubit() : super(CardCodeInputInitial()) {
    startCountdown();
  }

  void startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        emit(CardCodeInputCountdown(remainingTime));
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    remainingTime = 180;
    emit(CardCodeInputCountdown(remainingTime));
    startCountdown();
  }

  void resendTime(){
    remainingTime = 180;
    CardCodeInputCountdown(remainingTime);
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    disposeControllersAndFocusNodes();
    return super.close();
  }


  void disposeControllersAndFocusNodes() {
    for (var controller in pinControllers) {
      controller.dispose();
    }
    for (var focusNode in pinFocusNodes) {
      focusNode.dispose();
    }
  }

  void handleCodeInput(int index, String value) {
    if (_context != null) {
      if (value.isEmpty) {
        pinControllers[index].clear();
        if (index > 0) {
          FocusScope.of(_context!).requestFocus(pinFocusNodes[index - 1]);
        }
      } else {
        if (index == 5) {
          pinFocusNodes[index].unfocus();
        } else {
          FocusScope.of(_context!).requestFocus(pinFocusNodes[(index + 1) % 6]);
        }
      }
    }
  }

  // Regular setter method for _context
  void setContext(BuildContext context) {
    _context = context;
  }
}