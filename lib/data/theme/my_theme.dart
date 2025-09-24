import 'package:flutter/material.dart';



class MyTheme {
  static TextStyle bodyLargeGR = TextStyle(fontSize: 23,color: Color(0xFF10B981),fontWeight: FontWeight.w500,fontFamily: "nothing");
  static TextStyle bodySmallGR = TextStyle(fontSize: 13,color: Color(0xFF10B981),fontWeight: FontWeight.w400,fontFamily: "nothing");
  static TextStyle bodyLarge = TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.w600,fontFamily: "nothing");
  static TextStyle bodyMedium = TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w500,fontFamily: "nothing");
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
        primary: Colors.black,
        secondary: Colors.white,
        onPrimary: Color(0xFF10B981),
        inversePrimary: Colors.black87,
        primaryContainer: Colors.grey,
        onSecondary: Colors.grey.shade300,
        secondaryContainer: Colors.white,
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
        bodyLarge: const TextStyle(fontSize: 23,color: Color(0xFF475569),fontWeight: FontWeight.bold,fontFamily: "Font"),
        bodySmall: TextStyle(fontSize: 15,color: Color(0xFF9CA3AF),fontFamily: "Font",fontWeight: FontWeight.w600,),
        bodyMedium: TextStyle(fontSize: 14,color: Colors.black,fontFamily: "Font",fontWeight: FontWeight.w600)
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.black),
      surfaceTintColor: Colors.white,
      scrolledUnderElevation: 0,
    ),
  );
}