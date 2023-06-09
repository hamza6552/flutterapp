import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/app_constants.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

class ShippingInformation extends StatelessWidget {
  const ShippingInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          AppConstants.containerShadow
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  "Shipping Information",
                  style: StyleText.mediumDarkGrey16,
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 1,
                    shadowColor: UIColors.halfLight,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image(
                        image: AssetImage(
                          "assets/images/edit_icon_black.png",
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            10.verticalSpace,
            _textWithIcon("Pavan Singh", "assets/images/user_checkout.png"),
            10.verticalSpace,
            _textWithIcon("845 Rockville Pike, Rockville, MD ….",
                "assets/images/location_checkout.png"),
            10.verticalSpace,
            _textWithIcon("408-8585-4545", "assets/images/mobile_checkout.png")
          ],
        ),
      ),
    );
  }

  _textWithIcon(String text, String icon) {
    return Row(
      children: [
        Image(
          image: AssetImage(icon),
          height: 18.flexibleHeight,
          width: 18.flexibleWidth,
        ),
        10.horizontalSpace,
        Text(
          text,
          style: StyleText.regularLightGray15,
        )
      ],
    );
  }
}
