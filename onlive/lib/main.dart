import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlive/Features/Chat/presentation/screens/chat_overview_screen.dart';
import 'package:onlive/Features/Chat/presentation/screens/chat_screen.dart';
import 'package:onlive/Features/Registration/onboarding3.dart';
import 'package:onlive/Features/Registration/onboarding_college_selection.dart';
import 'package:onlive/Utils/Router/app_router.dart';
// <<<<<<< HEAD
// import 'package:onlive/Features/Registration/onboarding1.dart';
// =======
import 'package:onlive/Features/Registration/onboarding1.dart';
import 'package:onlive/Features/Registration/onboarding3.dart';

import 'Features/Auth/presentation/cubit/auth_cubit.dart';
import 'Features/Registration/presentation/screens/onboarding_avatar_selection_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: di.sl<AppRouter>().onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<AuthCubit>(),
          )
        ],
        child: ChatScreen(),
      ),
    );
  }
}
