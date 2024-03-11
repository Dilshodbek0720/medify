part of 'sign_cubit.dart';

class SignUpState {
  final bool isObscure;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode phoneFocusNode;
  final Color iconColor;
  final Color iconColor2;
  final Color iconColor3;

  SignUpState({
    required this.isObscure,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.phoneController,
    required this.phoneFocusNode,
    required this.iconColor,
    required this.iconColor2,
    required this.iconColor3,
  });

  SignUpState copyWith({
    bool? isObscure,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? phoneController,
    FocusNode? emailFocusNode,
    FocusNode? passwordFocusNode,
    FocusNode? phoneFocusNode,
    Color? iconColor,
    Color? iconColor2,
    Color? iconColor3,
  }) {
    return SignUpState(
      isObscure: isObscure ?? this.isObscure,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      phoneController: phoneController ?? this.phoneController,
      emailFocusNode: emailFocusNode ?? this.emailFocusNode,
      passwordFocusNode: passwordFocusNode ?? this.passwordFocusNode,
      phoneFocusNode: phoneFocusNode ?? this.phoneFocusNode,
      iconColor: iconColor ?? this.iconColor,
      iconColor2: iconColor2 ?? this.iconColor2,
      iconColor3: iconColor3 ?? this.iconColor3,
    );
  }
}