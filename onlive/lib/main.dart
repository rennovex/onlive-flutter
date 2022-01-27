import 'package:flutter/material.dart';
import 'package:onlive/screens/Login-screen.dart';
import 'package:onlive/screens/onboarding1.dart';
import 'package:onlive/screens/onboarding2.dart';
import 'package:onlive/screens/onboarding3.dart';

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
      home: OnBoarding_Third(),
    );
  }
}
