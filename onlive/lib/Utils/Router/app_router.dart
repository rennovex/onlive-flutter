import 'package:flutter/material.dart';
import 'package:onlive/Features/Auth/login-screen.dart';
import 'package:onlive/Features/Registration/onboarding1.dart';
import 'package:onlive/Features/Registration/onboarding2.dart';
import 'package:onlive/Features/Registration/onboarding3.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/onboarding1':
        return MaterialPageRoute(builder: (_) => const OnBoarding_First());
      case '/onboarding2':
        return MaterialPageRoute(builder: (_) => const OnBoarding_Second());
      case '/onboarding3':
        return MaterialPageRoute(builder: (_) => OnBoarding_Third());
      default:
        return null;
    }
  }
}
