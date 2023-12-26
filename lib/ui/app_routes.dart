import 'package:flutter/material.dart';
import 'package:medify/ui/auth/lets_in_screen.dart';
import 'package:medify/ui/auth/sign_in_screen.dart';
import 'package:medify/ui/auth/sign_up_screen.dart';
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
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Route not found!")),
          ),
        );
    }
  }
}