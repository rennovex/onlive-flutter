import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabled: false,
          //hintText: 'Name',
        ),
      ),
    );
  }
}
