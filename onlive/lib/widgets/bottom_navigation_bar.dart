import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class BottomNavigationBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('images/search_icon.png'),
        Image.asset('images/search_icon.png'),
        Image.asset('images/search_icon.png'),
        Image.asset('images/search_icon.png'),
      ],
    );
  }
}
