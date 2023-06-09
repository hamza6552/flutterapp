import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/models/read_products_model/read_products_model.dart';
import 'package:zabardash/screens/product_detail/product_details_screen.dart';
import 'package:zabardash/screens/store/Store_cat_Product.dart';

import '../../dummy_data.dart';

class StoreItemWidget extends StatefulWidget {
  StoreItemWidget({Key? key, this.productData}) : super(key: key);
  var  productData;

  @override
  State<StoreItemWidget> createState() => _StoreItemWidgetState(productData);
}

class _StoreItemWidgetState extends State<StoreItemWidget> {
  var productData;
  _StoreItemWidgetState(this.productData);
  void initState(){
    super.initState();
    print("c"+productData.toString());
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //    print("1c"+productData.toString());
      // },
      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>Cat_ProductScreen(productData: productData,))),
      child: Container(
        width: 182.flexibleWidth,
        height: 190.flexibleHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: UIColors.white,
            boxShadow: [
              BoxShadow(
                color: UIColors.shadowGrey,
                blurRadius: 16,
                spreadRadius: -10,
                // spreadRadius:1,
              ),
            ]),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  // imageUrl: storeItems!.imageUrl!,
                  imageUrl: productData["cateogryPicturePath"] ??
                      "https://images.unsplash.com/photo-1591465001609-ded6360ecaab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                  height: 125.flexibleHeight,
                  width: 270.flexibleWidth,
                  placeholder: (context, url) => ShimmerEffect(
                    height: 125.flexibleHeight,
                    width: 170.flexibleWidth,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.flexibleWidth, vertical: 6.flexibleHeight),
              child: Text(
              productData["title"],
                style: StyleText.regularLightGray13,
                textAlign: TextAlign.start,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
