import 'package:flutter/material.dart';
import 'package:onlive/constants.dart';

class ThickGradientCard extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final String img;
  final String para;
  const ThickGradientCard({
    required this.text,
    required this.para,
    required this.img,
    required this.onPressed,
  });

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
            Image.asset(img),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: kSubHeaderTextStyle,
                  ),
                  Text(
                    para,
                    style: kAlertTextStyle,
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
