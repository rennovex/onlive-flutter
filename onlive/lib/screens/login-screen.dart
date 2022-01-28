import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlive/Features/Auth/presentation/cubit/auth_cubit.dart';
import '../constants.dart';
import '../widgets/gradient_text.dart';
import '../widgets/login_button.dart';

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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return LoginButton(
                image: 'images/google_logo.png',
                text: 'Sign In with Google',
                onPressed: () async {
                  print('button pressed');
                  context.read<AuthCubit>().login();
                },
              );
            },
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
