import 'package:flutter/material.dart';
import 'package:medify/ui/auth/lets_in_screen.dart';
import 'package:medify/ui/auth/sign_in_screen.dart';
import 'package:medify/ui/auth/sign_up_screen.dart';
import 'package:medify/ui/category/category_screen.dart';
import 'package:medify/ui/enterence/onboarding/onboarding_pages.dart';
import 'package:medify/ui/enterence/welcome/welcome_screen.dart';
import 'package:medify/ui/forgot_password/confirm_code/confirm_code_screen.dart';
import 'package:medify/ui/forgot_password/create_password/create_password_screen.dart';
import 'package:medify/ui/forgot_password/forgot_password_screen.dart';
import 'package:medify/ui/payments/payment_add_card/payment_add_card_screen.dart';
import 'package:medify/ui/register/local_auth/enter_pin_screen.dart';
import 'package:medify/ui/register/local_auth/set_biometrics_screen.dart';
import 'package:medify/ui/register/register_screen.dart';
import 'package:medify/ui/search/search_screen.dart';
import 'package:medify/ui/splash/splash.dart';
import 'package:medify/ui/tab_box/home/sub_screens/favorite/favorite_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/notification/notification_screen.dart';
import 'package:medify/ui/tab_box/tab_box.dart';

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
  static const String fillYourProfile = "/fill_your_profile";
  static const String enterPinScreen = "/enter_pin_screen";
  static const String fingerPrintScreen = "/finger_print_screen";
  static const String paymentAddCard = "/payment_add_card";
  static const String tabBox = "/tab_box";
  static const String notificationScreen = "/notification_screen";
  static const String favoriteScreen = "/favorite_screen";
  static const String searchScreen = "/search_screen";
  static const String categoryScreen = "/category_screen";
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
      case RouteNames.fillYourProfile:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(navigateFromAuth: true),
        );
      case RouteNames.enterPinScreen:
        return MaterialPageRoute(
          builder: (context) => const EnterPinScreen(),
        );
      case RouteNames.fingerPrintScreen:
        return MaterialPageRoute(
          builder: (context) => const SetBiometricsScreen(),
        );
      case RouteNames.paymentAddCard:
        return MaterialPageRoute(
          builder: (context) => const PaymentAddCardScreen(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBox(),
        );
      case RouteNames.notificationScreen:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case RouteNames.favoriteScreen:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );
      case RouteNames.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case RouteNames.categoryScreen:
        return MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
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