import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/location.dart';
import 'package:zabardash/screens/login/login_screen.dart';
import 'package:zabardash/screens/onboarding/onboarding_screen.dart';
import 'package:zabardash/core/utils/sizes.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context,OnBoardingScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
  
              },
              child: Image(
                image: AssetImage("assets/images/logo-login.png"),
                height: 200.flexibleHeight,
                width: 350.flexibleWidth,

              ),
            ),

            Text(
              "Grocery Shopping Simplified",
              style:
                  StyleText.regularDarkGrey13.copyWith(color: UIColors.orange),
            )
          ],
        ),
      ),
    );
  }
}
