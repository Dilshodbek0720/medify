import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medify/utils/colors/app_colors.dart';
part 'sign_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit()
      : super(SignUpState(
    isObscure: true,
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    phoneController: TextEditingController(),
    emailFocusNode: FocusNode(),
    passwordFocusNode: FocusNode(),
    phoneFocusNode: FocusNode(),
    iconColor: AppColors.c_500,
    iconColor2: AppColors.c_500,
    iconColor3: AppColors.c_500,
  )) {
    state.emailFocusNode.addListener(emailFocusChanged);
    state.passwordFocusNode.addListener(passwordFocusChanged);
    state.passwordFocusNode.addListener(phoneFocusChanged);
  }

  void toggleObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  void updateEmail(String email) {
    Color newIconColor = email.isNotEmpty
        ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(emailController: state.emailController..text = email, iconColor: newIconColor));
  }

  void updatePassword(String password) {
    Color newIconColor2 = password.isNotEmpty
        ? (state.passwordFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.passwordFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(passwordController: state.passwordController..text = password, iconColor2: newIconColor2));
  }

  void updatePhone(String phoneNumber) {
    Color newIconColor3 = phoneNumber.isNotEmpty
        ? (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_900)
        : (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(phoneController: state.phoneController..text = phoneNumber, iconColor3: newIconColor3));
  }

  void emailFocusChanged() {
    Color newIconColor =
    state.emailController.text.isNotEmpty ? (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_900) : (state.emailFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(iconColor: newIconColor));
  }

  void passwordFocusChanged() {
    Color newIconColor2 =
    state.passwordController.text.isNotEmpty ? (state.passwordFocusNode.hasFocus ? AppColors.primary : AppColors.c_900) : (state.passwordFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(iconColor2: newIconColor2));
  }

  void phoneFocusChanged() {
    Color newIconColor2 =
    state.phoneController.text.isNotEmpty ? (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_900) : (state.phoneFocusNode.hasFocus ? AppColors.primary : AppColors.c_500);
    emit(state.copyWith(iconColor2: newIconColor2));
  }

  @override
  Future<void> close() {
    state.emailFocusNode.dispose();
    state.passwordFocusNode.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
    state.phoneController.dispose();
    state.phoneFocusNode.dispose();
    return super.close();
  }
}

