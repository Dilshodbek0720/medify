import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/screen_size.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit()
      : super(RegisterState(
    fullNameController: TextEditingController(),
    nicknameController: TextEditingController(),
    dateOfBirthController: TextEditingController(),
    emailController: TextEditingController(),
    fullNameFocusNode: FocusNode(),
    nicknameFocusNode: FocusNode(),
    dateOfBirthFocusNode: FocusNode(),
    emailFocusNode: FocusNode(),
    gender: 'Male',
    genders: ["Male","Female"],
    iconColor: AppColors.c_500,
    iconColor2: AppColors.c_500,
    selectedDate: DateTime.now(),
  )){
    state.emailFocusNode.addListener(emailFocusChanged);
  }

  void updateFullName(String fullName) {
    emit(state.copyWith());
  }

  void updateNickname(String nickname) {
    emit(state.copyWith());
  }

  void updateDateOfBirth(String dateOfBirth) {
    emit(state.copyWith(
      dateOfBirthController: state.dateOfBirthController..text = dateOfBirth,
    ));
  }

  void updateSelectedDate(DateTime newDate) {
    emit(state.copyWith(selectedDate: newDate));
  }

  void updateEmail(String email) {
    Color newIconColor = email.isNotEmpty
        ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(emailController:state.emailController..text=email,iconColor: newIconColor));
  }

  void emailFocusChanged() {
    Color newIconColor =
    state.emailController.text.isNotEmpty ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900) : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(iconColor: newIconColor));
  }

  void updateGender(String gender) {
    emit(state.copyWith(gender: gender,iconColor2: AppColors.c_900));
  }

  void updateFile(File file) {
    emit(state.copyWith(file: file));
  }

  @override
  Future<void> close() {
    state.fullNameController.dispose();
    state.nicknameController.dispose();
    state.emailController.dispose();
    state.dateOfBirthController.dispose();
    state.fullNameFocusNode.dispose();
    state.nicknameFocusNode.dispose();
    state.emailFocusNode.dispose();
    state.dateOfBirthFocusNode.dispose();
    return super.close();
  }

  Future<void> showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColors.c_50,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          height: 300 * height / figmaHeight,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime(2000),
            minimumDate: DateTime(1950),
            maximumDate: DateTime(2101),
            onDateTimeChanged: (DateTime newDate) {
              if (newDate != state.selectedDate) {
                state.dateOfBirthController.text =
                newDate.toLocal().toString().split(' ')[0];
                updateSelectedDate(newDate);
                context.read<RegisterCubit>().updateDateOfBirth(state.dateOfBirthController.text);
              }
            },
          ),
        );
      },
    );
    if (pickedDate != null && context.mounted && pickedDate != context.read<RegisterState>().selectedDate) {
      context.read<RegisterCubit>().updateSelectedDate(pickedDate);
    }
  }
}
