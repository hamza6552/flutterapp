import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zabardash/common/widgets/button_widget.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/login/login_screen.dart';
import 'package:zabardash/screens/signup/signup_bloc/signup_cubit.dart';

import '../../core/utils/flush_bar.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup-screen';

  SignupScreen({Key? key}) : super(key: key);

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: BlocProvider(
        create: (context) => SignupCubit(),
        child: Column(
          children: [
            logoWidget(),
            buildSignup(context),
          ],
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 140.flexibleWidth, vertical: 57.flexibleHeight),
      child: Image(
        image: AssetImage('assets/images/logo-login.png'),
        width: 135.74.flexibleWidth,
        height: 141.8.flexibleHeight,
      ),
    );
  }

  Widget buildSignup(BuildContext context) {
    return Expanded(
      child: Container(
        height: 502.flexibleHeight,
        width: 414.flexibleWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: UIColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: UIColors.grayTwo,
                blurRadius: 10,
                // offset: Offset(0,10),
              ),
            ]),
        padding: EdgeInsets.symmetric(
            horizontal: 35.flexibleWidth, vertical: 23.flexibleHeight),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget(),
              33.verticalSpace,
              fullNameFieldWidget(),
              22.verticalSpace,
              emailFieldWidget(),
              22.verticalSpace,
              passwordFieldWidget(),
              30.verticalSpace,
              registerBtnWidget(),
              28.verticalSpace,
              orDividerWidget(),
              25.verticalSpace,
              socialBtnWidget(),
              40.verticalSpace,
              signinWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get Started!',
          style: StyleText.mediumDarkGrey24,
          textAlign: TextAlign.left,
        ),
        Text(
          'You\'ll receive order updates & receipts',
          style: StyleText.mediumDarkGrey15,
        ),
      ],
    );
  }

  Widget fullNameFieldWidget() {
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
            controller: fullNameController,
            validator: (value) {
              return null;
            },
            textStyle: StyleText.mediumDarkGreySpacing14,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: 'Full Name',
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
                  Icon(
                    Icons.email_outlined,
                    size: 18.flexibleWidth,
                    color: UIColors.primaryColor,
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
              if (value!.isEmpty) {
                return 'Enter a valid password!';
              }
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

  Widget registerBtnWidget() {
    return SizedBox(
      height: 45.flexibleHeight,
      width: 345.flexibleWidth,
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is Loaded) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
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
          } else
            return ButtonWidget(
                btnClick: () async {
                  
                  await context.read<SignupCubit>().signup(emailController.text,
                      passwordController.text, fullNameController.text);
                    showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Email Verify"),
    content: Text("Check "+emailController.text+"For verfiy"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
                },
                btnText: 'REGISTER',
                brbottomRight: 6,
                brtopLeft: 6,
                brtopRight: 6,
                textStyle: StyleText.mediumWhite15);
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
        onPressed:primaryColor == UIColors.googleColor ? () async {
           final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        // use/r = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    // return user;
  
}
        
        :(){},
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

  Widget signinWidget(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Don\'t have an account? ',
            style: StyleText.mediumDarkGrey13,
            children: [
              TextSpan(
                text: 'Sign In',
                style: StyleText.regularlightGreen13
                    .copyWith(fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pop();
                  },
              )
            ],
          )),
    );
  }
}
