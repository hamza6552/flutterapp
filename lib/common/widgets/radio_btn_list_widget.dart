import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

import '../../dummy_data.dart';

class RadioBtnListWidget extends StatefulWidget {
  final String? title;
  final double? price;
  final bool? isSelected;
  final Function()? btnClick;
  final isGridView;
  RadioBtnListWidget(
      {Key? key, this.title,this.price, this.isSelected, this.btnClick ,this.isGridView = false})
      : super(key: key);

  @override
  _RadioBtnListWidgetState createState() => _RadioBtnListWidgetState();
}

class _RadioBtnListWidgetState extends State<RadioBtnListWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.btnClick,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 16.flexibleWidth,vertical: widget.isGridView ?  0 : 5.flexibleHeight  ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 20.0.flexibleHeight,
              width: 20.0.flexibleWidth,
              padding: EdgeInsets.all(3.flexibleHeight),
              child: Container(
                decoration: BoxDecoration(
                    color: UIColors.white, shape: BoxShape.circle),
              ),
              decoration: BoxDecoration(
                color:
                    widget.isSelected! ? UIColors.primaryColor : UIColors.white,
                border: new Border.all(
                    width: 1.0,
                    color: widget.isSelected!
                        ? UIColors.primaryColor
                        : UIColors.primaryColor),
                shape: BoxShape.circle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.flexibleWidth),
              child: Text(
                '${widget.title!}',
                style: StyleText.regularDarkGray14,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            widget.price!=null ? Text(
              '\$${widget.price!.toStringAsFixed(2)}',
              style: StyleText.regularDarkGray14,
            ) : Container()
          ],
        ),
      ),
    );
  }
}
// ListView.builder(
// physics: NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// padding: EdgeInsets.zero,
// itemBuilder: (context, index) {
// return RadioListTile(
// contentPadding: EdgeInsets.only(right: 16.flexibleWidth),
// activeColor: UIColors.primaryColor,
// value: index,
// groupValue: value,
// onChanged: (ind) => setState(() => value = index),
// title: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// '${productOptions[index].name}',
// style: StyleText.regularDarkGray14,
// ),
// Text(
// '${productOptions[index].prince!.toStringAsFixed(2)}',
// style: StyleText.regularDarkGray14,
// ),
// ],
// ),
// );
// },
// itemCount: productOptions.length,
// );
