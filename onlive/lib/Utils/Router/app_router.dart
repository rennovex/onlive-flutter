import 'package:flutter/material.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding3.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding_college_selection.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding_completion.dart.dart';

import '../../Features/Auth/login-screen.dart';
import '../../Features/Chat/presentation/screens/chat_overview_screen.dart';
import '../../Features/Chat/presentation/screens/chat_screen.dart';
import '../../Features/Registration/presentation/screens/onboarding1.dart';
import '../../Features/Registration/presentation/screens/onboarding2.dart';
import '../../Features/Registration/presentation/screens/onboarding_avatar_selection_screen.dart';

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
        return MaterialPageRoute(
            builder: (_) => const OnboardingAvatarSelectionScreen());
      case '/onboarding3':
        return MaterialPageRoute(builder: (_) => const OnBoarding_Second());
      case '/onboarding4':
        return MaterialPageRoute(builder: (_) => const OnBoarding_Third());
      case '/onboarding5':
        return MaterialPageRoute(
            builder: (_) => const OnBoardingCollegeSelection());
      case '/onboarding6':
        return MaterialPageRoute(builder: (_) => const OnBoardingCompletion());
      case '/chatOverview':
        return MaterialPageRoute(builder: (_) => const ChatOverviewScreen());
      case '/chat':
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      default:
        return null;
    }
  }
}
