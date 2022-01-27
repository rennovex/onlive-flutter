import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';
import 'package:onlive/widgets/input_box.dart';
import 'package:onlive/widgets/gradient_button.dart';

class OnBoarding_Second extends StatelessWidget {
  const OnBoarding_Second({Key? key}) : super(key: key);

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
                "Let's get you up and ",
                style: kHeaderTextStyle,
              ),
              Text(
                "running! ",
                style: kHeaderTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "We need know a bit about you to get your account up and running.",
                style: kParaTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/exclamation-icon.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'None of this information will  be visible to the public.',
                    style: kAlertTextStyle,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'NickName',
                style: kParaTextStyle,
              ),
              InputBox(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Age',
                style: kParaTextStyle,
              ),
              InputBox(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Email',
                style: kParaTextStyle,
              ),
              InputBox(),
              SizedBox(
                height: 15,
              ),
              Text(
                'Gender',
                style: kParaTextStyle,
              ),
              InputBox(),
              SizedBox(
                height: 20,
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
