// ignore_for_file: unnecessary_statements
import 'dart:convert';
import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/button_widget.dart';
import 'package:zabardash/common/widgets/price_widget.dart';
import 'package:zabardash/core/networking/api_controller.dart';
import 'package:zabardash/core/utils/app_constants.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/check_out/check_out_screen.dart';

class BottomCartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';
  const BottomCartScreen({Key? key}) : super(key: key);

  @override
  State<BottomCartScreen> createState() => _BottomCartScreenState();
}

class _BottomCartScreenState extends State<BottomCartScreen> {
  var main_list_cart = [];
  var main_list_product = [];
  var all_list_cart_product = [];
  var totalprice = 0;
  void initState() {
    super.initState();
    print("call");
    getdata();
  }

  var total_price = 0;
  var all_list_price = [];

  mergedata() async {
    all_list_cart_product = [];
    var card_price = 0;

    // print("main_list_cart.length" + main_list_cart.length.toString());
    for (var i = 0; i < main_list_cart.length; i++) {
      // print(main_list_cart[i]);
      print(main_list_cart[i]["category_id"]);
      final response = await ApiController.instance.GetCategoryProduct(
          main_list_cart[i]["store_id"], main_list_cart[i]["category_id"]);
      print(response);
      print("call data " + response.length.toString());

      for (var j = 0; j < response.length; j++) {
        print(response[j]);
        print(main_list_cart[i]["product_id"]);
        if (response[j]["id"] == main_list_cart[i]["product_id"]) {
          // print("pr"+);
          // print("q"+main_list_cart[i]["quantity"].toInt().runtimeType.toString());

          var quantity = response[j]["price"].toInt();
          var price = main_list_cart[i]["quantity"].toInt();

          card_price = quantity * price;
          print(card_price);

          totalprice += card_price;

          all_list_cart_product.add({
            "User_Id": main_list_cart[i]["userId"],
            "id": main_list_cart[i]["id"],
            "quantity": main_list_cart[i]["quantity"],
            "product_id": main_list_cart[i]["product_id"],
            "productPicturePath": response[j]["productPicturePath"],
            "name": response[j]["name"],
            "price": response[j]["price"],
            "store_id": response[j]["store_id"],
            "category_id": response[j]["category_id"]
          });
        }
        // print("cf" + all_list_cart_product.toString());

        setState(() {});
      }
    }
    //  final response = await ApiController.instance. GetCategoryProduct();

    // print("main_list_cart.length" + main_list_product.length.toString());

    // for (var i = 0; i < main_list_cart.length; i++) {
    //   for (var j = 0; j < main_list_product.length; j++) {
    //     if (main_list_cart[i]["product_id"] == main_list_product[j]["id"]) {
    //       all_list_cart_product.add({
    //         "User_Id": main_list_cart[i]["userId"],
    //         "id": main_list_cart[i]["id"],
    //         "quantity": main_list_cart[i]["quantity"],
    //         "product_id": main_list_cart[i]["product_id"],
    //         "productPicturePath": main_list_product[j]["productPicturePath"],
    //         "name": main_list_product[j]["name"],
    //         "price": main_list_product[j]["price"]
    //       });
    //       print(all_list_cart_product);

    //       // userId: 4, id: 43, quantity: 0, product_id: 3
    //       // productPicturePath,name,price

    //     }
    //   }
    // }
  }

  getdata() async {
    main_list_cart = [];
    all_list_cart_product = [];
    final response = await ApiController.instance.getAddTocart();
    // print("res");
    // print("length get call:" + response.length.toString());
    for (var i = 0; i < response.length; i++) {
      // print(response[i]);
      main_list_cart.add(response[i]);
    }

    // print(main_list_cart);
    mergedata();
    setState(() {});
//     // getproduct();
//     Future.delayed(const Duration(milliseconds: 1000), () {

// // Here you can write your code

//   setState(() {
//     // Here you can write your code for open new view
//   });

// });
  }

  // getproduct() async {

  //   //  print(response["featuredProductsData"][0]);
  //   for (var i = 0; i < response["featuredProductsData"].length; i++) {
  //     main_list_product.add(response["featuredProductsData"][i]);
  //   }
  //   // print(main_list_cart[0]["product_id"]);
  //   // print(main_list_product[0]["id"]);

  //   setState(() {});
  //   mergedata();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   padding: EdgeInsets.zero,
        //   constraints: BoxConstraints(),
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: UIColors.darkGray,
        //     size: 20.flexibleHeight,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        backgroundColor: UIColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Orders',
          style:
              StyleText.regularDarkGray18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.flexibleWidth, vertical: 30.flexibleHeight),
        child: SingleChildScrollView(
          child: Column(
            children: [
              orderItems(),
              20.verticalSpace,
              suggestedItems(),
              20.verticalSpace,
              totalprice != 0
                  ? PriceWidget(
                      isShowBottomSheet: true,
                      total_price: totalprice.toString(),
                      onbttomShetIconPressed: () {
                        showTaxBottomSheet(context);
                      },
                    )
                  : Container(),
              30.verticalSpace,
              checkOutBtnWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Container makeAddMinusid(String a) {
    return Container(
      width: 10,
      // width: 70.flexibleWidth,
      // height: 30.flexibleHeight,
      decoration: BoxDecoration(
          color: UIColors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1, color: UIColors.lightGray)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            splashRadius: 24,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.remove,
              color: UIColors.primaryColor,
              size: 20.flexibleHeight,
            ),
            onPressed: () {
              // addQuantity(false);
            },
          ),
          Text(
            a,
            style:
                StyleText.regularGreen18.copyWith(fontWeight: FontWeight.bold),
          ),
          IconButton(
            splashRadius: 24,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.add,
              color: UIColors.primaryColor,
              size: 20.flexibleHeight,
            ),
            onPressed: () {
              // addQuantity(true);
            },
          ),
        ],
      ),
    );
  }

  orderItems() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: UIColors.white,
        boxShadow: [
          BoxShadow(
            color: UIColors.halfLight,
            blurRadius: 16,
            spreadRadius: -10,
            // offset: Offset(0, 10),
          ),
        ],
      ),
      child: ListView.separated(
          itemCount: all_list_cart_product.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) =>
              Divider(height: 1),
          itemBuilder: (context, index) {
            if (index == 0) {
              total_price = 0;
            }
            // print(main_list_cart[index]["quantity"]);
            // print(int.parse(all_list_cart_product[index]["price"]
            //     .toString()
            //     .split(".")[0]));
            // all_list_cart_product[index]["quantity"] != 0 ||
            //         all_list_cart_product[index]["quantity"] != 1
            //     ? (total_price += int.parse(
            //             all_list_cart_product[index]["quantity"].toString()) *
            //         int.parse(all_list_cart_product[index]["price"]
            //             .toString()
            //             .split(".")[0]))
            //     : (total_price += int.parse(all_list_cart_product[index]
            //             ["price"]
            //         .toString()
            //         .split(".")[0]));

            // // print(total_price.toString());
            // if (all_list_cart_product.length == index) {
            //   // setState(() {
            //   //   total_price = total_price;
            //   // });
            // }

            // setState(() {

            // });
            // print(total_price);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.flexibleWidth),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: all_list_cart_product[index]
                          ["productPicturePath"],
                      height: 40.flexibleHeight,
                      width: 50.flexibleWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                  10.horizontalSpace,
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: UIColors.halfLight,
                  //     borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(5),
                  //         topLeft: Radius.circular(5),
                  //         bottomRight: Radius.circular(5)),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Text(
                  //      all_list_cart_product[index]["quantity"].toString(),
                  //       style: StyleText.mediumDarkGrey14,
                  //     ),
                  //   ),
                  // ),
                  10.horizontalSpace,
                  Flexible(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            all_list_cart_product[index]["name"].toString(),
                            style: TextStyle(
                              fontFamily: "Helvetica",
                              fontSize: 14.fontSize,
                              fontWeight: FontWeight.bold,
                              color: UIColors.darkGray,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                color: UIColors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 6, 124, 22))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    // print(all_list_cart_product[index]);
                                    // print(all_list_cart_product[index]
                                    // ["quantity"]
                                    // .toString());
                                    setState(() {
                                      all_list_cart_product[index]["quantity"] =
                                          all_list_cart_product[index]
                                                  ["quantity"] +
                                              1;
                                    });

                                    print(all_list_cart_product[index]);
                                    final response = await ApiController
                                        .instance
                                        .UpdateAddTocart(
                                            Data: all_list_cart_product[index]);

                                    getdata();

                                    // setState(() async {});
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  all_list_cart_product[index]["quantity"]
                                      .toString(),
                                  style: TextStyle(fontSize: 25),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // print(all_list_cart_product[index]);
                                    // print(all_list_cart_product[index]
                                    //         ["quantity"]
                                    //     .toString());
                                    setState(() {
                                      all_list_cart_product[index]["quantity"] =
                                          all_list_cart_product[index]
                                                  ["quantity"] -
                                              1;
                                    });
                                    final response = await ApiController
                                        .instance
                                        .UpdateAddTocart(
                                            Data: all_list_cart_product[index]);

                                    getdata();

                                    setState(() async {});
                                  },
                                  child: Text("-",
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                          "\$ ${all_list_cart_product[index]["price"] * all_list_cart_product[index]["quantity"]}"),

                      // trailing:   all_list_cart_product[index]["quantity"] != 0 ||
                      //     all_list_cart_product[index]["quantity"] != 1
                      // ? Row(
                      //     children: [
                      //       Text("\$"),
                      //       Text((
                      // all_list_cart_product[index]["quantity"] *
                      //               all_list_cart_product[index]["price"])
                      //           .toString()),
                      //     ],
                      //   )
                      // : Text(
                      //     all_list_cart_product[index]["price"],
                      //     style: StyleText.mediumDarkGrey14,
                      //   ),
                      // subtitle:Container(
                      //   width: 40,
                      //   child:Container(
                      //     width: 10,

                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [

                      //         Text( main_list_cart[index]["quantity"].toString()),
                      //         Text("-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      //       ],
                      //     ),
                      //   )
                      //   ),
                      //    Text(
                      //        main_list_cart[index]["quantity"].toString(),
                      //     style: StyleText.regularDarkGray14,
                      //   // ),
                      // ),
                    ),
                    // Spacer(),
                    // all_list_cart_product[index]["quantity"] != 0 ||
                    //         all_list_cart_product[index]["quantity"] != 1
                    //     ? Row(
                    //         children: [
                    //           Text("\$"),
                    //           Text((all_list_cart_product[index]["quantity"] *
                    //                   all_list_cart_product[index]["price"])
                    //               .toString()),
                    //         ],
                    //       )
                    //     : Text(
                    //         all_list_cart_product[index]["price"],
                    //         style: StyleText.mediumDarkGrey14,
                    //       ),
                    // 5.horizontalSpace,
                    // Icon(
                    //   Icons.delete_outlined,
                    //   color: UIColors.primaryColor,
                    // )
                  )
                ],
              ),
            );
          }),
    );
  }

  suggestedItems() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: UIColors.white,
        boxShadow: [AppConstants.containerShadow],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 12.flexibleWidth, vertical: 10.flexibleHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Suggested Item to add next",
              style: StyleText.mediumDarkGrey17,
            ),
            3.verticalSpace,
            Text(
              "Save time by adding related item in your current order.",
              style: StyleText.regularDarkGrey13,
            ),
            10.verticalSpace,

            ///TO DO (basit): add store details here
            // SizedBox(
            //   height: 215.flexibleHeight,
            //   child: ListView.builder(
            //       itemCount: storeItems.length,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(
            //               right: 8.0, top: 5, left: 5, bottom: 5),
            //           child: StoreItemWidget(
            //             onPressed: () {
            //               Navigator.of(context)
            //                   .pushNamed(ProductDetailsScreen.routeName);
            //             },
            //             storeItems: storeItems[index],
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }

  Widget checkOutBtnWidget(BuildContext context) {
    return SizedBox(
      height: 45.flexibleHeight,
      width: 200.flexibleWidth,
      child: ButtonWidget(
          btnClick: () {
            // print(total_price);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckOutScreen(
                        totalprice.toString(), all_list_cart_product)));
          },
          btnText: 'CHECKOUT',
          brbottomRight: 6,
          brtopLeft: 6,
          brtopRight: 6,
          textStyle: StyleText.mediumWhite15),
    );
  }

  textRow(String leading, String trailing) {
    return Row(
      children: [
        Text(
          "$leading",
          style: StyleText.regularLightGray14,
        ),
        Spacer(),
        Text(
          "$trailing",
          style: StyleText.regularLightGray14,
        )
      ],
    );
  }

  showTaxBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: UIColors.white),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0.flexibleWidth),
              topRight: Radius.circular(12.0.flexibleWidth),
            )),
        context: context,
        builder: (_) {
          return Container(
            margin: const EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: UIColors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0.flexibleWidth),
                  topLeft: Radius.circular(12.0.flexibleWidth)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/drawer.png"),
                          height: 25,
                          width: 25,
                        ),
                        10.horizontalSpace,
                        Text(
                          "Fee & Tax",
                          style: StyleText.mediumDarkGrey17,
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: UIColors.darkGray,
                          size: 35,
                        ))
                  ],
                ),
                5.verticalSpace,
                Text(
                  "Service Fee : \$5.2",
                  style: StyleText.mediumDarkGrey13,
                ),
                Text(
                  "Reduced Service Fee \$5.0 with Zabardash,This service fee helps us operate Zabardash.",
                  style: StyleText.regularDarkGrey13,
                ),
                10.verticalSpace,
                Text(
                  "Estimated Tax : \$3.2",
                  style: StyleText.mediumDarkGrey13,
                ),
                Text(
                  "Finalized Tax will be shown on your order receipt.",
                  style: StyleText.regularDarkGrey13,
                ),
                20.verticalSpace,
                Center(
                  child: SizedBox(
                    height: 37.flexibleHeight,
                    width: 150.flexibleWidth,
                    child: ButtonWidget(
                        btnClick: () {
                          Navigator.of(context).pop();
                        },
                        btnText: 'OK',
                        brbottomRight: 6,
                        brtopLeft: 6,
                        brtopRight: 6,
                        textStyle: StyleText.mediumWhite15),
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          );
        });
  }
}
