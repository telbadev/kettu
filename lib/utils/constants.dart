








import 'package:flutter/material.dart';

String img1 = 'assets/images/img1.jpg';
String img2 = 'assets/images/img2.jpg';
String img3 = 'assets/images/img3.jpg';
String arrowRight = 'assets/images/arrow_right.png';
String coinImage = 'assets/images/coin.png';
String mathImage = 'assets/images/math.png';
String pcImage = 'assets/images/computer.png';
String englishImage = 'assets/images/english.png';
String fontFamily = 'Font11';
Color activeDayColor = const Color.fromRGBO(31, 176, 149, 1);
Color disableDayColor = Colors.red;
Color todayColor = const Color.fromRGBO(224, 154, 105, 1);
Color myOrangeColor = const Color.fromRGBO(255, 139, 61, 1.0);
Color secondColor = const Color.fromRGBO(75, 36, 252, 1.0);
List<Color> bgColors = [Color(0xFFE3F2FD), Color(0xFFFFFFFF),Color(0xFFE8F5E9)];

double screnHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screnWidth(context) {
  return MediaQuery.of(context).size.width;
}