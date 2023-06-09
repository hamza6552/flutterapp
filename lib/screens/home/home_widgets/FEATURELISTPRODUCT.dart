import 'dart:convert';
import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/core/networking/api_controller.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/models/home_data_model/home_data_model.dart';
import 'package:zabardash/screens/home/home_bloc/home_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:zabardash/screens/product_detail/product_details_screen.dart';

class FeatureProductList extends StatefulWidget {
  var featuredPageData;
  FeatureProductList(this.featuredPageData);
  @override
  State<FeatureProductList> createState() =>
      _FeatureProductListState(featuredPageData);
}

class _FeatureProductListState extends State<FeatureProductList> {
  var featuredPageData;
  _FeatureProductListState(this.featuredPageData);

  var main_list_cart = [];
  var main_list_product = [];
  var all_list_cart_product = [];
  var totalprice = 0;
  void initState() {
    super.initState();
    print("call");
    getdata();
  }

  getdata() async {
    print("call" + featuredPageData.toString());
    main_list_cart = [];
    all_list_cart_product = [];
    final response = await ApiController.instance.getAllproduct();
    print("sjgfhsghfghsfhg");
    print(response.length);
    for (var i = 0; i < response.length; i++) {
      print("List of Recipe: ${response[i]}");
      print(featuredPageData["title"].toString().toLowerCase());
      print(response[i]["name"].toString().toLowerCase());
      if (featuredPageData["title"].toString().substring(0, 3).toLowerCase() ==
          response[i]["name"].toString().substring(0, 3).toLowerCase()) {
        main_list_cart.add(response[i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              featuredPageData["storePicturePath"],
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            // bottomRight: Radius.circular(50)
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                color: UIColors.primaryColor,
                                width: 40,

                                height: 3,
                                // width: double.infinity,
                                child: Text("data"),
                              ),
                              Text(
                                featuredPageData["title"],
                                style: TextStyle(
                                    color: UIColors.primaryColor, fontSize: 30),
                              ),
                              Container(
                                color: UIColors.primaryColor,
                                width: 40,
                                height: 3,
                                // width: double.infinity,
                                child: Text("data"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // Align(
                          //     alignment: Alignment.centerLeft,
                          //     child: Text(
                          //       "Selected Store",
                          //       style: TextStyle(
                          //           fontSize: 25, fontWeight: FontWeight.bold),
                          //     )),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // //Button
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: TextButton(
                          //       onPressed: () {},
                          //       style: TextButton.styleFrom(
                          //         backgroundColor: UIColors.primaryColor,
                          //         shape: const RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(15))),
                          //       ),
                          //       child: Text(
                          //         "Halal Fresh Supermarket",
                          //         style: TextStyle(
                          //             fontSize: 15,
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.black),
                          //       )),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Products",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 1.0),
                              physics: NeverScrollableScrollPhysics(),
                              // padding: EdgeInsets.only(bottom: 13.flexibleHeight),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                print("Store1" +
                                    main_list_cart[index].toString());
                                return GestureDetector(
                                  onTap: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    // prefs.setInt("Store_Id", id! );
                                    // print("Dtaa"+id!.toString());
                                    // Navigator.of(context).pushNamed(StoreScreen.routeName,
                                    // arguments: widget.readStoresData![index]);
                                  },
                                  child: Container(
                                    // width: 20,
                                    height: 250,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 30,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 9,
                                                left: 10,
                                                right: 10,
                                                top: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        main_list_cart[index][
                                                            "productPicturePath"],
                                                      ),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              height: 100,
                                              width: 130,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 14),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // mainAxisSize: MainAxisSize.,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      main_list_cart[index]
                                                          ["name"],
                                                      style: StyleText
                                                          .boldDarkGray14,
                                                    ),
                                                    Text(
                                                      "\$ ${main_list_cart[index]["price"]}",
                                                      style: StyleText
                                                          .regular1LightGray13,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 30.flexibleWidth,
                                                  height: 41.flexibleHeight,
                                                  decoration: BoxDecoration(
                                                    color: UIColors.halfLight,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(15),
                                                      topLeft:
                                                          Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProductDetailsScreen(
                                                                  productData:
                                                                      main_list_cart[
                                                                          index],
                                                                ))),
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          UIColors.primaryColor,
                                                      size: 18.flexibleHeight,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // child: Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     ClipRRect(
                                  //       borderRadius: BorderRadius.circular(6),
                                  //       child: CachedNetworkImage(
                                  //         fit: BoxFit.cover,
                                  //         imageUrl:
                                  //             "https://images.immediate.co.uk/production/volatile/sites/30/2021/02/butter-chicken-ac2ff98.jpg",
                                  //         height: 139.flexibleHeight,
                                  //         width: 382.flexibleWidth,
                                  //         placeholder: (context, url) =>
                                  //             ShimmerEffect(
                                  //           height: 139.flexibleHeight,
                                  //           width: 382.flexibleWidth,
                                  //         ),
                                  //         errorWidget: (context, url, error) =>
                                  //             Icon(Icons.error),
                                  //       ),
                                  //     ),
                                  //     Column(
                                  //       mainAxisAlignment: MainAxisAlignment.start,
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Text(
                                  //               "title!",
                                  //               style: StyleText.boldDarkGray14,
                                  //             ),
                                  //             Spacer(
                                  //               flex: 2,
                                  //             ),
                                  //             Text(
                                  //               'rating}',
                                  //               style: StyleText.regularDarkGray13,
                                  //             ),
                                  //             Icon(
                                  //               Icons.star,
                                  //               color: UIColors.yellow,
                                  //               size: 18.flexibleHeight,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         Text(
                                  //           "address}",
                                  //           style: StyleText.regular1LightGray13,
                                  //         ),
                                  //       ],
                                  //     )
                                  //   ],
                                  // ),
                                );
                              },
                              itemCount: main_list_cart?.length,
                            ),
                          ),
                        ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
  // Container(
  //                                     width: 30.flexibleWidth,
  //                                     height: 41.flexibleHeight,
  //                                     decoration: BoxDecoration(
  //                                       color: UIColors.halfLight,
  //                                       borderRadius: BorderRadius.only(
  //                                         bottomRight: Radius.circular(10),
  //                                       ),
  //                                     ),
  //                                     child: InkWell(
  //                                       onTap: () => Navigator.push(
  //                                           context,
  //                                           MaterialPageRoute(
  //                                               builder: (context) =>
  //                                                   ProductDetailsScreen(
  //                                                     productData:
  //                                                         Product_cat[index],
  //                                                   ))),
  //                                       child: Icon(
  //                                         Icons.add,
  //                                         color: UIColors.primaryColor,
  //                                         size: 18.flexibleHeight,
  //                                       ),
  //                                     ),
  //                                   ),