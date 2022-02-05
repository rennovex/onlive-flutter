import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';
import 'package:onlive/widgets/gradient_button.dart';
import 'package:onlive/widgets/thick_gradient_card.dart';

class OnBoardingCompletion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You're all set!",
                style: kHeaderTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Center(child: Image.asset('images/registration_done.png')),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "Seems like you're all set to be connected anonymously",
                  style: kParaTextStyle,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: GradientButon(
                  onPressed: () {},
                  text: "Let's Gooo",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
