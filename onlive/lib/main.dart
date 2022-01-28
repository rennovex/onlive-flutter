import 'package:flutter/material.dart';
import 'screens/Login-screen.dart';
import 'screens/onboarding1.dart';
import 'screens/onboarding2.dart';
import 'screens/onboarding3.dart';

void main() {
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
      home: LoginScreen(),
    );
  }
}