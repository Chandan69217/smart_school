import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_school/screens/authentication/login_screen.dart';
import 'package:smart_school/screens/splash/splash_screen.dart';
import 'package:smart_school/utilities/my_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart School',
      theme: myThemeData(context),
      home: SplashScreen(),
    );
  }

}

