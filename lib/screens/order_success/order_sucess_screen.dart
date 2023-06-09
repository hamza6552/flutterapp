import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/orders/order_screen.dart';

class OrderSuccessScreen extends StatelessWidget {
  static const routeName = '/order-success-screen';

  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image(
            image: AssetImage("assets/images/order_sucess.png"),
            height: 300,
            width: 300,
          ),
        ),
        20.verticalSpace,
        Text(
          "Thank you for your order",
          style: StyleText.boldDarkGrey23,
        ),
        10.verticalSpace,
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderScreen()));
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'We are currently processing your order.\nYou can find updates to your Order\n under',
              style: StyleText.regularShadowGray14.copyWith(
                letterSpacing: 1,
                wordSpacing: 1,
              ),
              children: [
                TextSpan(
                    text: ' your Orders',
                    style: StyleText.regularGreen14
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
        30.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Container(
            decoration: BoxDecoration(
              color: UIColors.halfLight,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text(
                    'Order Number',
                    style: StyleText.regularDarkGray14
                        .copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    '#2318501',
                    style: StyleText.regularDarkGray14,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
