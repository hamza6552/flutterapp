import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/app_constants.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

class OrderView extends StatefulWidget {
  var Product_List;
  // final Function()? onPressed;
  // const OrderView({Key? key,this.onPressed},this.``) : super(key: key);
  OrderView(this.Product_List);

  @override
  State<OrderView> createState() => _OrderViewState(Product_List);
}

class _OrderViewState extends State<OrderView> {
   var Product_List;
  // final Function()? onPressed;

  _OrderViewState(this.Product_List);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:(){},
        child: Container(
          height: 100,

          child: Row(
            children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      AppConstants.containerShadow
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(imageUrl:Product_List["productPicturePath"],
                    height: 80.flexibleHeight,
                      width: 130.flexibleWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Product_List["description"],style: StyleText.mediumDarkGrey14,),
                   3.verticalSpace,
                    Row(
                      children: [
                        Text("\$ ${Product_List['order_price']}",style: StyleText.regularprimary14,),
                        Spacer(),
                        Column(
                          children: [
                            Text("Quantity : ${Product_List['quantity']}",style: StyleText.regularprimary13,),

                            Text("Order Status : ${Product_List['isDelivered']}",style: StyleText.regularprimary13,),
                          ],
                        )
                      ],
                    ),


                    15.verticalSpace,

                    Row(
                      children: [
                        Text("Processing",style: StyleText.regularLightGray14,),
                        Spacer(),
                        Text("Mar 15,2020",style: StyleText.regularLightGray13,),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
