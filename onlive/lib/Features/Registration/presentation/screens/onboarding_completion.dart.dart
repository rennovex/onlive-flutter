import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../widgets/gradient_button.dart';

class OnBoardingCompletion extends StatelessWidget {
  const OnBoardingCompletion({Key? key}) : super(key: key);

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
