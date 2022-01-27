import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('images/abc.png'),
    ));
  }
}
