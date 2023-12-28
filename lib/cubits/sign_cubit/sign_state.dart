part of 'sign_cubit.dart';

class SignUpState {
  final bool isObscure;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final Color iconColor;
  final Color iconColor2;

  SignUpState({
    required this.isObscure,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.iconColor,
    required this.iconColor2,
  });

  SignUpState copyWith({
    bool? isObscure,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    FocusNode? emailFocusNode,
    FocusNode? passwordFocusNode,
    Color? iconColor,
    Color? iconColor2,
  }) {
    return SignUpState(
      isObscure: isObscure ?? this.isObscure,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      emailFocusNode: emailFocusNode ?? this.emailFocusNode,
      passwordFocusNode: passwordFocusNode ?? this.passwordFocusNode,
      iconColor: iconColor ?? this.iconColor,
      iconColor2: iconColor2 ?? this.iconColor2,
    );
  }
}