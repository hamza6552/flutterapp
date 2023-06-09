import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/networking/api_controller.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/models/read_products_model/read_products_model.dart';
import 'package:zabardash/screens/product_detail/product_details_screen.dart';

import '../../dummy_data.dart';

class Cat_ProductScreen extends StatefulWidget {
  Cat_ProductScreen({Key? key, this.productData}) : super(key: key);
  var productData;

  @override
  State<Cat_ProductScreen> createState() =>
      _Cat_ProductScreenState(productData);
}

class _Cat_ProductScreenState extends State<Cat_ProductScreen> {
  var productData;
  _Cat_ProductScreenState(this.productData);
  void initState() {
    super.initState();
    print("c2" + productData.toString());
    GetCategoryProduct();
  }

  var Product_cat = [];

  GetCategoryProduct() async {
    // print("id"+_storeDataModel?.id.toString());

    final response = await ApiController.instance
        .GetCategoryProduct(productData["storeid"], productData["id"]);
    print("Dtaa :" + response.runtimeType.toString());
    for (var i = 0; i < response.length; i++) {
      print(response[i]);
      Product_cat.add(response[i]);
      // Category.add(response[i]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topWidget(context),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                //  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=> ));
                child: Container(
                  width: 320.flexibleWidth,
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
                            fit: BoxFit.fill,
                            // imageUrl: storeItems!.imageUrl!,
                            imageUrl: productData["cateogryPicturePath"] ??
                                // imageUrl:
                                "https://images.unsplash.com/photo-1591465001609-ded6360ecaab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            height: 160.flexibleHeight,
                            width: 320.flexibleWidth,
                            placeholder: (context, url) => ShimmerEffect(
                              height: 125.flexibleHeight,
                              width: 170.flexibleWidth,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.flexibleWidth,
                            vertical: 6.flexibleHeight),
                        child: Text(
                          productData["title"],
                          style: StyleText.regularLightGray13,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 16.flexibleHeight),
              itemCount: Product_cat.length,
              itemBuilder: (context, index) {
                // print( _storeDataModel!.id);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            // imageUrl: storeItems!.imageUrl!,
                            imageUrl: Product_cat[index]
                                    ["productPicturePath"] ??
                                "https://images.unsplash.com/photo-1591465001609-ded6360ecaab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            height: 120.flexibleHeight,
                            width: 300.flexibleWidth,
                            placeholder: (context, url) => ShimmerEffect(
                              height: 125.flexibleHeight,
                              width: 170.flexibleWidth,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.flexibleWidth,
                            vertical: 6.flexibleHeight),
                        child: Text(
                          Product_cat[index]["description"],
                          style: StyleText.regularLightGray13,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.flexibleWidth),
                                  child: Text(
                                    Product_cat[index]["name"],
                                    style: StyleText.mediumDarkGrey13
                                        .copyWith(fontWeight: FontWeight.w600),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.flexibleWidth),
                                  child: Text(
                                    '\$${Product_cat[index]["price"]} ',
                                    style: StyleText.regularDarkGrey13
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.flexibleWidth,
                                        vertical: 4.flexibleHeight),
                                    child: Text(
                                      'Aisle  Section B',
                                      style: StyleText.regularDarkGrey11,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 30.flexibleWidth,
                            height: 41.flexibleHeight,
                            decoration: BoxDecoration(
                              color: UIColors.halfLight,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(productData: Product_cat[index],))),
                              child: Icon(
                                Icons.add,
                                color: UIColors.primaryColor,
                                size: 18.flexibleHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 210.flexibleHeight,
                  crossAxisSpacing: 10.flexibleWidth,
                  mainAxisSpacing: 10.flexibleHeight),
            )
          ],
        ),
      ),
    );
  }

  Widget topWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.flexibleWidth,
          top: 40.flexibleHeight,
          right: 16.flexibleWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: UIColors.darkGray,
              size: 20.flexibleHeight,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.flexibleWidth),
              child: Stack(
                children: [
                  Container(
                    height: 45.flexibleHeight,
                    width: 275.flexibleWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6)),
                        boxShadow: [
                          BoxShadow(
                              color: UIColors.shadowGrey,
                              blurRadius: 16,
                              spreadRadius: -10,
                              offset: Offset(0, 2)
                              // spreadRadius:1,
                              ),
                        ]),
                  ),
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
                      trfbr: 6,
                      tlfbr: 6,
                      blfbr: 6,
                      hcontentPadding: 19.flexibleWidth,
                      vcontentPadding: 17.flexibleHeight,
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 17.1.flexibleWidth,
                              right: 16.9.flexibleWidth),
                          child: Icon(
                            Icons.search,
                            color: UIColors.primaryColor,
                            size: 24.flexibleHeight,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.favorite_outline,
              color: UIColors.primaryColor,
              size: 20.flexibleHeight,
            ),
            onPressed: () {},
          ),
          4.horizontalSpace,
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.file_upload_outlined,
              color: UIColors.darkGray,
              size: 20.flexibleHeight,
            ),
            onPressed: () {},
            // onPressed: () {
            //   showDialog<void>(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return PopupProductCateogries();
            //     },
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
