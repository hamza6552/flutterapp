import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zabardash/common/widgets/button_widget.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/flush_bar.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/bottom_navigation/bottom_navigation_widget.dart';
import 'package:zabardash/screens/signup/signup_screen.dart';
import './login_bloc/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
  // final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Padding(
          padding: EdgeInsets.only(
              left: 35.flexibleWidth,
              right: 35.flexibleWidth,
              top: 57.flexibleHeight),
          child: ListView(
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            children: [
              logoWidget(),
              56.verticalSpace,
              titleWidget(),
              27.verticalSpace,
              emailFieldWidget(),
              22.verticalSpace,
              passwordFieldWidget(),
              13.verticalSpace,
              forgetPasswordWidget(),
              30.verticalSpace,
              loginBtnWidget(context),
              28.verticalSpace,
              orDividerWidget(),
              33.verticalSpace,
              socialBtnWidget(),
              40.verticalSpace,
              signupWidget(context),
              22.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Align(
      alignment: Alignment.center,
      child: Image(
        image: AssetImage('assets/images/logo-login.png'),
        width: 135.74.flexibleWidth,
        height: 141.8.flexibleHeight,
      ),
    );
  }

  Widget titleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back!',
          style: StyleText.mediumDarkGrey24,
        ),
        Text(
          'Please Sign in to continue',
          style: StyleText.mediumDarkGrey15,
        ),
      ],
    );
  }

  Widget emailFieldWidget() {
    return Stack(
      children: [
        Container(
          height: 50.flexibleHeight,
          width: 345.flexibleWidth,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(6), boxShadow: [
            BoxShadow(
                color: UIColors.shadowGrey, blurRadius: 10, spreadRadius: -10
                // spreadRadius:1,
                ),
          ]),
        ),
        SizedBox(
          height: 50.flexibleHeight,
          width: 345.flexibleWidth,
          child: TextFormFieldWidget(
            controller: emailController,
            validator: (value) {
              return null;
            },
            textStyle: StyleText.mediumDarkGreySpacing14,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            hintText: 'Email Address',
            hintStyle: StyleText.hintStyle,
            fillColor: UIColors.white,
            trbr: 6,
            tlbr: 6,
            blbr: 6,
            brbr: 6,
            trfbr: 6,
            tlfbr: 6,
            blfbr: 6,
            brfbr: 6,
            hcontentPadding: 19.flexibleWidth,
            vcontentPadding: 17.flexibleHeight,
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  left: 19.flexibleWidth, right: 10.5.flexibleWidth),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage('assets/images/user.png'),
                    width: 18.flexibleWidth,
                    height: 18.flexibleHeight,
                  ),
                  9.4.horizontalSpace,
                  SizedBox(
                    height: 21.flexibleHeight,
                    child: VerticalDivider(
                      color: UIColors.vDividerGrey,
                      thickness: 1,
                      width: 0.5.flexibleWidth,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordFieldWidget() {
    return Stack(
      children: [
        Container(
          height: 50.flexibleHeight,
          width: 345.flexibleWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: UIColors.shadowGrey,
                    blurRadius: 10,
                    spreadRadius: -10
                    // spreadRadius:1,
                    ),
              ]),
        ),
        SizedBox(
          height: 50.flexibleHeight,
          width: 345.flexibleWidth,
          child: TextFormFieldWidget(
            controller: passwordController,
            validator: (value) {
              return null;
            },
            obscureText: true,
            textStyle: StyleText.mediumDarkGreySpacing14,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.emailAddress,
            hintText: 'Password',
            hintStyle: StyleText.hintStyle,
            fillColor: UIColors.white,
            trbr: 6,
            tlbr: 6,
            blbr: 6,
            brbr: 6,
            trfbr: 6,
            tlfbr: 6,
            blfbr: 6,
            brfbr: 6,
            hcontentPadding: 19.flexibleWidth,
            vcontentPadding: 17.flexibleHeight,
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  left: 19.flexibleWidth, right: 10.5.flexibleWidth),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage('assets/images/password.png'),
                    width: 18.flexibleWidth,
                    height: 18.flexibleHeight,
                  ),
                  9.4.horizontalSpace,
                  SizedBox(
                    height: 21.flexibleHeight,
                    child: VerticalDivider(
                      color: UIColors.vDividerGrey,
                      thickness: 1,
                      width: 0.5.flexibleWidth,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget forgetPasswordWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 222.flexibleWidth),
      child: Text(
        'Forgot Password?',
        style: StyleText.regularprimary13,
      ),
    );
  }

  Widget loginBtnWidget(BuildContext context) {
    return SizedBox(
      height: 45.flexibleHeight,
      width: 345.flexibleWidth,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Loaded) {
            Navigator.of(context)
                .pushReplacementNamed(BottomNavigationScreen.routeName);
          }
          if (state is Error) {
            FlushBar.showFlushBar(
                title: 'Error',
                message: '${state.error}',
                context: context,
                color: UIColors.declinedColor,
                seconds: 3);
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ButtonWidget(
                btnClick: () async {
                  await context
                      .read<LoginCubit>()
                      .login(emailController.text, passwordController.text);
                },
                btnText: 'LOGIN',
                brbottomRight: 6,
                brtopLeft: 6,
                brtopRight: 6,
                textStyle: StyleText.mediumWhite15);
          }
        },
      ),
    );
  }

  Widget orDividerWidget() {
    return Row(
      children: [
        SizedBox(
            width: 139.flexibleWidth,
            child: Divider(
              color: UIColors.hDividerGrey.withOpacity(0.39),
              thickness: 1,
            )),
        25.horizontalSpace,
        Text(
          'or',
          style: StyleText.hintStyle,
        ),
        25.horizontalSpace,
        SizedBox(
            width: 139.flexibleWidth,
            child: Divider(
              color: UIColors.hDividerGrey.withOpacity(0.39),
              thickness: 1,
            )),
      ],
    );
  }

  Widget buildSocialWidget(String imagePath, Color primaryColor) {
    return SizedBox(
      height: 38.flexibleHeight,
      width: 100.flexibleWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            )),
        child: Image(
          image: AssetImage(imagePath),
          width: 18.flexibleWidth,
          height: 18.flexibleHeight,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget socialBtnWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSocialWidget('assets/images/facebook.png', UIColors.fbColor),
        buildSocialWidget('assets/images/google.png', UIColors.googleColor),
        buildSocialWidget('assets/images/apple.png', UIColors.darkGray),
      ],
    );
  }

  Widget signupWidget(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: StyleText.mediumDarkGrey13,
          children: [
            TextSpan(
              text: 'Sign Up',
              style:
                  StyleText.lightGreen12.copyWith(fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(SignupScreen.routeName);
                },
            )
          ],
        ));
  }
}
