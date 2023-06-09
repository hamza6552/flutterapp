import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

import '../../dummy_data.dart';

class PopupProductCateogries extends StatefulWidget {
  const PopupProductCateogries({Key? key}) : super(key: key);

  @override
  _PopupProductCateogriesState createState() => _PopupProductCateogriesState();
}

class _PopupProductCateogriesState extends State<PopupProductCateogries> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: UIColors.backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text('Product Categories',
          style: StyleText.regularDarkGray17
              .copyWith(fontWeight: FontWeight.w600)),
      content: Container(
          width: 351.flexibleWidth,
          height: 441.flexibleHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 324.flexibleWidth,
                child: Divider(
                  color: UIColors.shadowGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.flexibleHeight),
                child: Text('Select category',
                    style: StyleText.regularDarkGray17
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
              12.verticalSpace,
              SizedBox(
                height: 45.flexibleHeight,
                width: 275.flexibleWidth,
                child: TextFormFieldWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid search!';
                    }
                    return null;
                  },
                  textStyle: StyleText.mediumDarkGreySpacing14,
                  textInputAction: TextInputAction.next,
                  hintText: 'Search within store',
                  hintStyle: StyleText.regularLightGray13,
                  fillColor: UIColors.white,
                  trbr: 6,
                  tlbr: 6,
                  blbr: 6,
                  brbr: 6,
                  trfbr: 6,
                  tlfbr: 6,
                  blfbr: 6,
                  brfbr: 6,
                  fborderColor: UIColors.primaryColor,
                  borderColor: UIColors.primaryColor,
                  hcontentPadding: 19.flexibleWidth,
                  vcontentPadding: 17.flexibleHeight,
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 17.1.flexibleWidth, right: 16.9.flexibleWidth),
                      child: Icon(
                        Icons.search,
                        color: UIColors.primaryColor,
                        size: 24.flexibleHeight,
                      )),
                ),
              ),
              10.verticalSpace,
              Expanded(
                  child: RawScrollbar(
                thumbColor: UIColors.primaryColor,
                thickness: 4,
                mainAxisMargin: 6,
                radius: Radius.circular(100),
                isAlwaysShown: true,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 10.flexibleWidth),
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _category_list(categories_list_item[index]);
                  },
                  itemCount: categories_list_item.length,
                ),
              ))
            ],
          )),
    );
  }

  _category_list(String cat_title) {
    return Container(
      height: 70.flexibleHeight,
      width: 297.flexibleWidth,
      margin: EdgeInsets.only(top: 6.flexibleHeight),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: UIColors.white,
          border: Border.all(color: UIColors.dotGray)),
      padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
      alignment: Alignment.centerLeft,
      child: Text(cat_title,
          style: StyleText.regularDarkGray15
              .copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
