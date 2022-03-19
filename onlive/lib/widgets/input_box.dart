import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // label: Text('asdf'),
        // labelText: 'Nickname'
        // ,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        isDense: true,
        border: OutlineInputBorder(),

        // labelText: 'Enter Name Here',
        // hintText: 'Enter Name Here',
      ),
    );
  }
}
