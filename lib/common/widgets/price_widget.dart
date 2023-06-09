import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

class PriceWidget extends StatelessWidget {
  final bool? isShowBottomSheet;
  final Function()? onbttomShetIconPressed;
  String? total_price;
  PriceWidget({Key? key,this.isShowBottomSheet = false,this.onbttomShetIconPressed,this.total_price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pricetotal(total_price);
  }

  Container pricetotal(total_price) {
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: UIColors.white,
      boxShadow: [
        BoxShadow(
          color: UIColors.halfLight,
          blurRadius: 16,
          spreadRadius: -10,
          // blurRadius: 8,
          // spreadRadius: 4,
          // offset: Offset(0, 10),
        ),
      ],
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.flexibleWidth,vertical: 10.flexibleHeight),
      child: Column(
        children: [
          textRow("Item Total","\$${total_price}"),
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Fees & Tax",style: StyleText.regularLightGray14,),
                  isShowBottomSheet! ? IconButton(
                    padding: EdgeInsets.zero,
                          icon:Icon(Icons.info_sharp),
                          onPressed: onbttomShetIconPressed,
                          color: UIColors.primaryColor,iconSize: 20,) : Container() ,
                ],
              ),

              Text("\$10",style: StyleText.regularLightGray15,)
            ],
          ),
          10.verticalSpace,
          Divider(),
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",style: StyleText.mediumDarkGrey17,),

              Text("\$${total_price}",style: StyleText.mediumDarkGrey17,)
            ],
          ),
          5.verticalSpace,
        ],
      ),
    ),
  );
  }
  textRow(String leading,String trailing){
    return Row(
      children: [
        Text("$leading",style: StyleText.regularLightGray15,),
        Spacer(),
        Text("$trailing",style: StyleText.regularLightGray15,)
      ],
    );
  }
}
