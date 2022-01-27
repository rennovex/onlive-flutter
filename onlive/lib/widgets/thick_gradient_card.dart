import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';

class ThickGradientCard extends StatelessWidget {
  // final Function() onPressed;
  // final String text;
  // const GradientButton({
  //   required this.text,
  //   // required this.onPressed,
  // });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        constraints: BoxConstraints(maxWidth: 370.0, minHeight: 120.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: kbuttonGradient,
          //borderRadius: BorderRadius.circular(80.0),
          boxShadow: [
            kLoginButtonBoxShadow,
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/card_illustration1.png'),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Onlive Campus',
                    style: kSubHeaderTextStyle,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Interact wity your own campus mates.',
                        style: kAlertTextStyle,
                      ),
                      Text(
                        ' Who knows who your next anynomous buddy will be?',
                        style: kAlertTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
