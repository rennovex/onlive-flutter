import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlive/constants.dart';
import 'package:onlive/widgets/gradient_text.dart';
import 'package:onlive/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('images/onlive_logo.png'),
              width: 100,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Onlive',
            style: kHeaderTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'connecting you,anonymously!',
            style: kParaTextStyle,
          ),
          SizedBox(
            height: 100,
          ),
          LoginButton(
            image: 'images/google_logo.png',
            text: 'Sign In with Google',
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: GradientText("Read Terms of Serice",
                gradient: kgradientText,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
