import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';
import 'package:onlive/widgets/gradient_button.dart';
import 'package:onlive/widgets/thick_gradient_card.dart';

class OnBoardingCollegeSelection extends StatelessWidget {
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
                "Select your campus",
                style: kSubHeaderTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: GradientButon(
                    //text = "Next",
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
