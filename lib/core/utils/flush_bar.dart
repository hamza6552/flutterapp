import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

class FlushBar {
  static void showFlushBar(
      {String? title,
      String? message,
      BuildContext? context,
      Color? color,
      int? seconds}) {
    Flushbar(
      margin: EdgeInsets.all(16.flexibleWidth),
      title: title,
      messageText: Text(
        "$message",
        style: StyleText.regularWhite14,
      ),
      duration: Duration(seconds: seconds!),
      borderRadius: BorderRadius.circular(8),
      isDismissible: true,
      backgroundColor: color!,
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.BOTTOM,
    )..show(context!);
  }
}
