import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';
import 'package:onlive/widgets/gradient_button.dart';
import 'package:onlive/widgets/thick_gradient_card.dart';

class OnBoarding_Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: TextButton(
            onPressed: () {},
            child: Image.asset('images/arrow_back.png'),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Image.asset('images/questionmarkicon.png'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You're almost set!",
                style: kHeaderTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "what would you like to do on onlive?",
                style: kSubHeaderTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              ThickGradientCard(),
              SizedBox(
                height: 30,
              ),
              ThickGradientCard(),
            ],
          ),
        ),
      ),
    );
  }
}
