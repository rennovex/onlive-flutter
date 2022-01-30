import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlive/Features/Registration/onboarding1.dart';
import 'package:onlive/Features/Registration/onboarding3.dart';

import 'Features/Auth/presentation/cubit/auth_cubit.dart';
import 'Features/Registration/onboarding_college_selection.dart';
import 'Features/Registration/onboarding_completion.dart.dart';
import 'injection_container.dart' as di;
import 'package:onlive/Features/Auth/login-screen.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoarding_First(),
      // MultiBlocProvider(
      //   providers: [
      //     BlocProvider(
      //       create: (context) => di.sl<AuthCubit>(),
      //     )
      //   ],
      //   child: LoginScreen(),
      // ),
    );
  }
}
