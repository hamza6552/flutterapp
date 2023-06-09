import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';

class SelectionContainer extends StatelessWidget {
  final String? title;
  final Function()? btnClick;
  final TextStyle? textStyle;
  final bool? isSelected;
  final BorderRadius? borderRadius;

  SelectionContainer(
      {this.title,
      this.btnClick,
      this.textStyle,
      this.isSelected,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnClick,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected! ? UIColors.primaryColor : UIColors.halfLight,
            borderRadius: borderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Text(
              title!,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
