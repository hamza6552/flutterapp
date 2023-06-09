import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/app_constants.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

class StoreInformation extends StatelessWidget {
  const StoreInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // elevation: 1,
      // shadowColor: UIColors.halfLight,
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
            Text(
              "Store Information",
              style: StyleText.mediumDarkGrey16,
            ),
            10.verticalSpace,
            _textWithIcon("Hamza Saleem - Taj Mahal Desi Bazaar",
                "assets/images/user_checkout.png"),
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
