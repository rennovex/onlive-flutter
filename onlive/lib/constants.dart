import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///API

const String host = 'http://onlive-nodejs-dev2.ap-south-1.elasticbeanstalk.com';

///

const kHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontSize: 27,
  color: Color(0XFF494949),
);

const kActionHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontFamily: 'Poppins',
  fontSize: 18,
  color: Color.fromRGBO(46, 45, 45, 1),
);

const kSubHeaderTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontSize: 24,
  color: Color(0XFF979797),
);
const kParaTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  fontSize: 14,
  color: Color(0XFF494949),
);
const kAlertTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: 'Poppins',
  fontSize: 13,
  color: Color(0XFF494949),
);

const kgradientText =
    LinearGradient(colors: <Color>[Color(0xFF02B9FA), Color(0XFF35D893)]);

const kbuttonGradient = LinearGradient(
  colors: [Color(0xFF02B9FA), Color(0XFF35D893)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

final BoxShadow kLoginButtonBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.25),
  spreadRadius: 0,
  blurRadius: 11,
  offset: Offset(0, 4), // changes position of shadow
);
