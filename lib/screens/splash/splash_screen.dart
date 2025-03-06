import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_school/screens/authentication/login_screen.dart';
import 'package:smart_school/utilities/cust_colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    futureCall(context);
    return Scaffold(
      backgroundColor: CustColor.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/splash_logo.webp',
              width: screenWidth * 0.3,
              height: screenWidth * 0.3,
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Smart School',
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            SpinKitFadingCube(
              color: Colors.white,
              size: screenWidth * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  futureCall(BuildContext context){
    Future.delayed(Duration(seconds: 2),()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginScreen())));
  }
}
