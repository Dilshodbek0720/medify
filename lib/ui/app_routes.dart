import 'package:flutter/material.dart';
import 'package:medify/ui/onboarding/onboarding_pages.dart';
import 'package:medify/ui/splash/splash.dart';
import 'package:medify/ui/welcome/welcome_screen.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingPages = "/onboarding_pages";
  static const String welcomeScreen = "/welcome";
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
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Route not found!")),
          ),
        );
    }
  }
}