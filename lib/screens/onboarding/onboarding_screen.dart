import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/bottom_navigation/bottom_navigation_widget.dart';
import 'package:zabardash/screens/login/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/onboard-screen';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: UIColors.white,
      pages: [
        PageViewModel(
          titleWidget: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(
              'assets/images/onboard1.png',
              height: 400.flexibleHeight,
              width: 400.flexibleWidth,
              fit: BoxFit.cover,
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                'Search',
                style: StyleText.mediumDarkGrey24,
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Text(
                  'Discover stores offering the best grocery near you on Zabardash',
                  style: StyleText.regularShadowGray14,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Image.asset(
              'assets/images/onboard2.png',
              height: 400.flexibleHeight,
              width: 400.flexibleWidth,
              fit: BoxFit.cover,
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                'Order',
                style: StyleText.mediumDarkGrey24,
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Text(
                  'Discover stores offering the best grocery near you on Zabardash',
                  style: StyleText.regularShadowGray14,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Container(
            margin: EdgeInsets.only(top: 30.flexibleHeight),
            child: Image.asset(
              'assets/images/onboard3.png',
              height: 400.flexibleHeight,
              width: 400.flexibleWidth,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                'Save',
                style: StyleText.mediumDarkGrey24,
              ),
              40.verticalSpace,
              Text(
                'Save money on the products you love and trust by exploring various stores near you.',
                style: StyleText.regularShadowGray14,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Image.asset(
              'assets/images/onboard4.png',
              height: 400.flexibleHeight,
              width: 400.flexibleWidth,
              fit: BoxFit.cover,
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                'Recipes',
                style: StyleText.mediumDarkGrey24,
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Text(
                  'Find and easily buy the ingredients of your favorite dishes through Zabardash recipes',
                  style: StyleText.regularShadowGray14,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Image.asset(
              'assets/images/onboard5.png',
              height: 400.flexibleHeight,
              width: 400.flexibleWidth,
              fit: BoxFit.cover,
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                'Delivered',
                style: StyleText.mediumDarkGrey24,
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Text(
                  'Get your preferred groceries delivered to you from your favorite stores through Zabardash.',
                  style: StyleText.regularShadowGray14,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Image.asset(
              'assets/images/onboard6.png',
              height: 400.flexibleHeight,
              width: 400.flexibleWidth,
              fit: BoxFit.cover,
            ),
          ),
          bodyWidget: Column(
            children: [
              Text(
                'Find',
                style: StyleText.mediumDarkGrey24,
              ),
              40.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Text(
                  'Save time in store by finding where an item is located while you are shopping inside a Zabardash store.',
                  style: StyleText.regularShadowGray14,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ],
      doneColor: UIColors.primaryColor,
      done: const Text(
        'Done',
        style: TextStyle(fontSize: 15, color: UIColors.primaryColor),
      ),
      showDoneButton: true,
      onDone: () {

        Navigator.of(context)
            .pushReplacementNamed(LoginScreen.routeName);

      },
      dotsFlex: 3,
      dotsDecorator: DotsDecorator(
          color: UIColors.dotGray, activeColor: UIColors.primaryColor),
      next: Text(
        'Next',
        style: StyleText.mediumDarkGrey15,
      ),
      controlsPadding: EdgeInsets.only(top: 10),
      showSkipButton: true,
      skip: Text(
        'Skip',
        style: StyleText.mediumDarkGrey15,
      ),
    );
  }
}
