import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/app_selection_widget.dart';
import 'package:zabardash/common/widgets/button_widget.dart';
import 'package:zabardash/common/widgets/popup_product_categories.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/practiceapi.dart';
import 'package:zabardash/screens/savings_product/savings_product_screen.dart';

import '../../core/networking/api_controller.dart';
import '../../dummy_data.dart';
import 'savingrecepitproduct.dart';

class SavingsRecipies extends StatefulWidget {
  static const routeName = '/savings-screen';
  const SavingsRecipies({Key? key}) : super(key: key);

  @override
  State<SavingsRecipies> createState() => _SavingsRecipiesState();
}

class _SavingsRecipiesState extends State<SavingsRecipies> {
  String? title;
  int isSelected = 0;
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
    main_list_cart = [];
    all_list_cart_product = [];
    final response = await ApiController.instance.getRecpie();
    print("My Recipes Response: ${response}");

    // print("res");
    // print("length get call:" + response.length.toString());
    for (var i = 0; i < response.length; i++) {
      main_list_cart.add(response[i]);
      // print("List of Recipe: ${response[i]}");
      print("Food Type: ${response[i]["title"]}");
    }

    // print(main_list_cart);
    // mergedata();
    setState(() {});
//     // getproduct();
//     Future.delayed(const Duration(milliseconds: 1000), () {

// // Here you can write your code

//   setState(() {
//     // Here you can write your code for open new view
//   });

// });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              topWidget(context),
              // SizedBox(
              //   height: 40,
              // ),
              titleWidget(),
              SizedBox(
                height: 10,
              ),
              // Stack(
              //   children: [
              //     Container(
              //       // decoration: BoxDecoration(
              //       //   border: Border.all(width: 2,style: BorderStyle.solid),
              //       //   borderRadius: BorderRadius.circular(50)),
              //       margin: EdgeInsets.only(
              //           left: 20.flexibleWidth, right: 20.flexibleWidth),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(22),
              //         child: CachedNetworkImage(
              //           fit: BoxFit.cover,
              //           imageUrl:
              //               'https://images.immediate.co.uk/production/volatile/sites/30/2021/02/butter-chicken-ac2ff98.jpg',
              //           // : "${state.readStoresModel![index].storePicturePath}",
              //           height: 135.flexibleHeight,
              //           width: MediaQuery.of(context).size.width,
              //           placeholder: (context, url) => ShimmerEffect(
              //             width: 228.flexibleWidth,
              //             height: 135.flexibleHeight,
              //           ),
              //           errorWidget: (context, url, error) => Icon(Icons.error),
              //         ),
              //       ),
              //     ),
              //     // Positioned(
              //     //   right: 20.flexibleWidth,
              //     //   child: IconButton(
              //     //     padding: EdgeInsets.zero,
              //     //     constraints: BoxConstraints(),
              //     //     onPressed: () {},
              //     //     icon: Icon(
              //     //       Icons.favorite_outline,
              //     //       color: UIColors.primaryColor,
              //     //       size: 18.flexibleHeight,
              //     //     ),
              //     //   ),
              //     // ),
              //     Positioned(
              //       left: 34.flexibleWidth,
              //       child: Container(
              //         height: 32.flexibleHeight,
              //         width: 189.flexibleWidth,
              //         margin: EdgeInsets.only(top: 110.flexibleWidth),
              //         child: ButtonWidget(
              //             btnClick: () async {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) =>
              //                         const SavingRecpietProduct()),
              //               );
              //             },
              //             btnText: 'Lemon Store',
              //             brbottomRight: 6,
              //             brtopLeft: 6,
              //             textStyle: StyleText.regularDarkGrey13.copyWith(
              //                 fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              // Stack(
              //   children: [
              //     Container(
              //       // decoration: BoxDecoration(
              //       //   border: Border.all(width: 2,style: BorderStyle.solid),
              //       //   borderRadius: BorderRadius.circular(50)),
              //       margin: EdgeInsets.only(
              //           left: 20.flexibleWidth, right: 20.flexibleWidth),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(22),
              //         child: CachedNetworkImage(
              //           fit: BoxFit.cover,
              //           imageUrl:
              //               'https://images.immediate.co.uk/production/volatile/sites/30/2021/02/butter-chicken-ac2ff98.jpg',
              //           // : "${state.readStoresModel![index].storePicturePath}",
              //           height: 135.flexibleHeight,
              //           width: MediaQuery.of(context).size.width,
              //           placeholder: (context, url) => ShimmerEffect(
              //             width: 228.flexibleWidth,
              //             height: 135.flexibleHeight,
              //           ),
              //           errorWidget: (context, url, error) => Icon(Icons.error),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       right: 20.flexibleWidth,
              //       child: IconButton(
              //         padding: EdgeInsets.zero,
              //         constraints: BoxConstraints(),
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.favorite_outline,
              //           color: UIColors.primaryColor,
              //           size: 18.flexibleHeight,
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       left: 34.flexibleWidth,
              //       child: Container(
              //         height: 32.flexibleHeight,
              //         width: 189.flexibleWidth,
              //         margin: EdgeInsets.only(top: 110.flexibleWidth),
              //         child: ButtonWidget(
              //             btnClick: () async {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => ModuleByUser()));
              //             },
              //             btnText: 'Lemon Store',
              //             brbottomRight: 6,
              //             brtopLeft: 6,
              //             textStyle: StyleText.regularDarkGrey13.copyWith(
              //                 fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              //       ),
              //     ),
              //   ],
              // )
              // productStatusListWidget(),
              // productItemList()
              // Text("id"),
              // Text("Title"),

              Container(
                // height: 800,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: main_list_cart?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              // decoration: BoxDecoration(
                              //   border: Border.all(width: 2,style: BorderStyle.solid),
                              //   borderRadius: BorderRadius.circular(50)),
                              margin: EdgeInsets.only(
                                  left: 20.flexibleWidth,
                                  right: 20.flexibleWidth),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: main_list_cart[index]["image"],
                                  // : "${state.readStoresModel![index].storePicturePath}",
                                  height: 135.flexibleHeight,
                                  width: MediaQuery.of(context).size.width,
                                  placeholder: (context, url) => ShimmerEffect(
                                    width: 228.flexibleWidth,
                                    height: 135.flexibleHeight,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   right: 20.flexibleWidth,
                            //   child: IconButton(
                            //     padding: EdgeInsets.zero,
                            //     constraints: BoxConstraints(),
                            //     onPressed: () {},
                            //     icon: Icon(
                            //       Icons.favorite_outline,
                            //       color: UIColors.primaryColor,
                            //       size: 18.flexibleHeight,
                            //     ),
                            //   ),
                            // ),
                            Positioned(
                              left: 34.flexibleWidth,
                              child: Container(
                                height: 32.flexibleHeight,
                                width: 189.flexibleWidth,
                                margin: EdgeInsets.only(top: 110.flexibleWidth),
                                child: ButtonWidget(
                                    btnClick: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SavingRecpietProduct(
                                                    savingPicture:
                                                        main_list_cart[index]
                                                            ["image"],
                                                    savingtitle:
                                                        main_list_cart[index]
                                                            ["title"])),
                                      );
                                    },
                                    btnText: main_list_cart[index]["title"]
                                        .toString(),
                                    brbottomRight: 6,
                                    brtopLeft: 6,
                                    textStyle: StyleText.regularDarkGrey13
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                    // return Expanded(
                    //   child: Column(
                    //     children: [
                    //       Text(main_list_cart[index]["id"].toString()),
                    //       Text(main_list_cart[index]["title"].toString()),
                    //       Text(main_list_cart[index]["image"].toString()),
                    //     ],
                    //   ),
                    // );
                  },
                ),
              )
            ],
          ),
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
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 45.flexibleHeight,
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
          Padding(
            padding: EdgeInsets.only(left: 20.flexibleWidth),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.file_upload_outlined,
                color: UIColors.darkGray,
                size: 20.flexibleHeight,
              ),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return PopupProductCateogries();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWidget() {
    return Stack(
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
              horizontal: 16.flexibleWidth, vertical: 20.flexibleHeight),
          padding: EdgeInsets.symmetric(
              horizontal: 20.flexibleWidth, vertical: 24.flexibleHeight),
          decoration: BoxDecoration(
            color: UIColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'ZABARDASH',
                  style: StyleText.mediumWhite16.copyWith(
                    fontSize: 30,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
              6.verticalSpace,
              Container(
                child: Text('RECIPES',
                    style: StyleText.mediumWhite24.copyWith(
                        letterSpacing: 1.3,
                        fontSize: 35,
                        color: UIColors.yellow)),
              ),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width - 150,
          top: 60,
          child: Image(
            image: AssetImage(
              'assets/images/saving_chef.jpg',
            ),
            height: 100.flexibleHeight,
          ),
        )
      ],
    );
  }

  // Widget productStatusListWidget() {
  //   return Container(
  //     height: 40.flexibleHeight,
  //     margin: EdgeInsets.only(bottom: 10.flexibleHeight),
  //     child: ListView.builder(
  //         itemCount: storeStatus.length,
  //         scrollDirection: Axis.horizontal,
  //         padding: EdgeInsets.only(left: 20.flexibleWidth),
  //         itemBuilder: (context, index) {
  //           return Container();
  //           // Padding(
  //           //   padding: EdgeInsets.only(right: 20.flexibleWidth),
  //           //   child: SelectionContainer(
  //           //     title: storeStatus[index],
  //           //     textStyle: isSelected == index
  //           //         ? StyleText.regularWhite16
  //           //         : StyleText.regularWhite16
  //           //             .copyWith(color: UIColors.primaryColor),
  //           //     isSelected: isSelected == index ? true : false,
  //           //     borderRadius: BorderRadius.only(
  //           //         topRight: Radius.circular(8),
  //           //         topLeft: Radius.circular(8),
  //           //         bottomRight: Radius.circular(8)),
  //           //     btnClick: () {
  //           //       setState(() {
  //           //         isSelected = index;
  //           //       });
  //           //     },
  //           //   ),
  //           // );
  //         }),
  //   );
  // }

  // Widget productItemList() {
  //   return Expanded(
  //     child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
  //         child: GridView.builder(
  //           shrinkWrap: true,
  //           physics: ScrollPhysics(),
  //           padding: EdgeInsets.symmetric(vertical: 16.flexibleHeight),
  //           itemCount: storeItems.length,
  //           itemBuilder: (context, index) {
  //             return _savingsProducts(storeItems[index]);
  //           },
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               mainAxisExtent: 200.flexibleHeight,
  //               crossAxisSpacing: 10.flexibleWidth,
  //               mainAxisSpacing: 10.flexibleHeight),
  //         )),
  //   );
  // }

  _savingsProducts(StoreItems storeItems) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed(SavingsProductScreen.routeName),
      child: Container(
        width: 182.flexibleWidth,
        height: 210.flexibleHeight,
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: storeItems.imageUrl!,
            height: 125.flexibleHeight,
            width: 170.flexibleWidth,
            placeholder: (context, url) => ShimmerEffect(
              height: 125.flexibleHeight,
              width: 170.flexibleWidth,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
