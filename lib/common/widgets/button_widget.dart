import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? btnText;
  final double? pTop;
  final double? pLeft;
  final double? pBottom;
  final double? pRight;
  final Function()? btnClick;
  final double? brtopLeft;
  final double? brtopRight;
  final double? brbottomLeft;
  final double? brbottomRight;
  final double? elevation;
  final TextStyle? textStyle;

  ButtonWidget({
    this.btnText,
    this.btnClick,
    this.brbottomLeft,
    this.brbottomRight,
    this.brtopLeft,
    this.brtopRight,
    this.elevation,
    this.textStyle,
    this.pTop,
    this.pLeft,
    this.pBottom,
    this.pRight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
            top: pTop ?? 0,
            left: pLeft ?? 0,
            right: pRight ?? 0,
            bottom: pBottom ?? 0,
          ),
          elevation: elevation ?? 0,
          primary: UIColors.primaryColor,
          // background
          onPrimary: UIColors.white,
          // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(brtopLeft ?? 0),
              topRight: Radius.circular(brtopRight ?? 0),
              bottomLeft: Radius.circular(brbottomLeft ?? 0),
              bottomRight: Radius.circular(brbottomRight ?? 0),
            ),
          )),
      child: Text(
        btnText ?? "",
        style: textStyle,
      ),
      onPressed: btnClick!,
    );
  }
}
