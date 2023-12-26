import 'package:flutter/material.dart';
import 'package:medify/ui/auth/lets_in_screen.dart';
import 'package:medify/ui/auth/sign_in_screen.dart';
import 'package:medify/ui/auth/sign_up_screen.dart';
import 'package:medify/ui/forgot_password/confirm_code/confirm_code_screen.dart';
import 'package:medify/ui/forgot_password/create_password/create_password_screen.dart';
import 'package:medify/ui/forgot_password/forgot_password_screen.dart';
import 'package:medify/ui/onboarding/onboarding_pages.dart';
import 'package:medify/ui/splash/splash.dart';
import 'package:medify/ui/welcome/welcome_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingPages = "/onboarding_pages";
  static const String welcomeScreen = "/welcome";
  static const String signInScreen = "/sign_in_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String letsInScreen = "/lets_in_screen";
  static const String forgotPassword = "/forgot_password";
  static const String confirmCodeScreen = "/confirm_code_screen";
  static const String createPassword = "/create_password";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case RouteNames.onBoardingPages:
        return MaterialPageRoute(
          builder: (context) => const OnboardingPages(),
        );
      case RouteNames.letsInScreen:
        return MaterialPageRoute(
          builder: (context) => const LetsYouInScreen(),
        );
      case RouteNames.signInScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPassWord(),
        );
      case RouteNames.confirmCodeScreen:
        return MaterialPageRoute(
          builder: (context) => const ConfirmCodeScreen(),
        );
      case RouteNames.createPassword:
        return MaterialPageRoute(
          builder: (context) => const CreatePasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Route not found!")),
          ),
        );
    }
  }
}