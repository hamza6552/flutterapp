import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/sizes.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/textStyle.dart';

class NotAvailableHomeWidget extends StatelessWidget {
  final String? text;
  const NotAvailableHomeWidget({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 18.flexibleWidth),
      padding: EdgeInsets.symmetric(horizontal: 20.flexibleWidth),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: UIColors.darkGray.withOpacity(0.5)),
      alignment: Alignment.center,
      child: Text(
        "$text",
        style: StyleText.mediumWhite16,
      ),
    );
  }
}
