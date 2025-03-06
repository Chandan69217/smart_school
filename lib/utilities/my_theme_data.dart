import 'package:flutter/material.dart';

ThemeData myThemeData(BuildContext context){
  double fontSize = MediaQuery.of(context).size.width;
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 23,fontFamily: 'Poppins'),
      headlineMedium: TextStyle(fontSize: fontSize * 0.055,fontFamily: 'Poppins'),
      bodyLarge: TextStyle(fontSize: 15,fontFamily: 'Poppins'),
      bodyMedium: TextStyle(fontSize: fontSize * 0.035,fontFamily: 'Poppins'),
      labelMedium: TextStyle(fontSize: fontSize * 0.04,fontFamily: 'Poppins'),
      bodySmall: TextStyle(fontSize: fontSize * 0.033,fontFamily: 'Poppins'),
    )
  );
}