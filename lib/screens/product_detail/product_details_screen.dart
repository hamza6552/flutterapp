import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zabardash/common/widgets/button_widget.dart';
import 'package:zabardash/common/widgets/plus_minus_widget.dart';
import 'package:zabardash/common/widgets/radio_btn_list_widget.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/di/dependency_injection.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/pref_utils.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/models/read_products_model/read_products_model.dart';
import 'package:zabardash/screens/cart/cart_screen.dart';
import 'package:zabardash/screens/home/home_screen.dart';

import '../../core/networking/api_controller.dart';
import '../../core/utils/preference_keys.dart';
import '../../dummy_data.dart';
import '../bottom_navigation/bottom_navigation_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/add-product-screen';
  var productData;
  ProductDetailsScreen({Key? key, this.productData}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState(productData);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var productData;
  _ProductDetailsScreenState(this.productData);
  void initState() {
    super.initState();
    print("c2" + productData.toString());
  }

  int? isSelected = 0;
  int? removeFromOrder = 0;
  // ReadProductsModel? readProductsModel;

  int? quantity = 0;
  void addQuantity(bool value) {
    if (value) {
      setState(() {
        quantity = quantity! + 1;
      });
    } else {
      setState(() {
        if (quantity! > 0) {
          quantity = quantity! - 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // readProductsModel =
    //     ModalRoute.of(context)!.settings.arguments as ReadProductsModel;
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          topWidget(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  productImage(),
                  productTitle(),
                  priceWidget(),
                  //  optionListWidget(),
                  removeFromOrderWidget(),
                  specialInstructions(),
                  10.verticalSpace,
                  addToCartBtnWidget(context),
                  20.verticalSpace,
                ],
              ),
            ),
          )
        ],
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen()));
            },
          ),
          Container(
            height: 40.flexibleHeight,
            width: 40.flexibleWidth,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: UIColors.white,
                boxShadow: [
                  BoxShadow(
                      color: UIColors.shadowGrey,
                      blurRadius: 16,
                      spreadRadius: -10,
                      offset: Offset(-4, 2))
                ]),
            alignment: Alignment.center,
            child: Icon(
              Icons.add_shopping_cart,
              color: UIColors.darkGray,
              size: 20.flexibleHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget productImage() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: 16.flexibleWidth, vertical: 10.flexibleHeight),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: UIColors.white,
          boxShadow: [
            BoxShadow(
              color: UIColors.shadowGrey,
              blurRadius: 16,
              spreadRadius: -10,
            )
          ]),
      padding: EdgeInsets.symmetric(
          vertical: 6.flexibleHeight, horizontal: 5.flexibleWidth),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: productData["productPicturePath"],
          height: 200.flexibleHeight,
          width: 334.flexibleWidth,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }

  Container makeAddMinusid() {
    return Container(
      width: 100.flexibleWidth,
      height: 30.flexibleHeight,
      decoration: BoxDecoration(
          color: UIColors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1, color: UIColors.lightGray)),
      child: Padding(
        padding: EdgeInsets.only(left: 5.flexibleWidth, right: 5.flexibleWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                addQuantity(false);
              },
            ),
            Text(
              '$quantity',
              style: StyleText.regularGreen18
                  .copyWith(fontWeight: FontWeight.bold),
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
                addQuantity(true);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget productTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              productData["name"],
              style: StyleText.boldDarkGrey23,
            ),
          ),
          5.horizontalSpace,
          makeAddMinusid()
        ],
      ),
    );
  }

  Widget priceWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.flexibleWidth, vertical: 8.flexibleHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productData["price"].toString(),
            style: StyleText.boldDarkGrey24,
          ),
          // Text(
          //   'Aisle ${readProductsModel?.aisle}, Bay ${readProductsModel?.bay}',
          //   style: StyleText.regularLightGray14,
          // ),
        ],
      ),
    );
  }

  Widget optionTitleWidget() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Column(
          children: [
            optionTitle(), 3.verticalSpace,

            //  optionListWidget()
          ],
        );
      },
      itemCount: 1,
    );
  }

  optionTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.flexibleWidth, vertical: 8.flexibleHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Meat Cut Options',
            style: StyleText.mediumDarkGrey14,
          ),
          Container(
            decoration: BoxDecoration(
                color: UIColors.lightBlue,
                borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.symmetric(
                horizontal: 14.flexibleWidth, vertical: 5.flexibleHeight),
            child: Text(
              '1 required',
              style: StyleText.regularShadowGray14
                  .copyWith(color: UIColors.darkBlue),
            ),
          ),
        ],
      ),
    );
  }

  // Widget optionListWidget() {
  //   return ListView.builder(
  //     physics: NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     padding: EdgeInsets.zero,
  //     itemBuilder: (context, index) {
  //       return RadioBtnListWidget(
  //         isSelected: isSelected == index ? true : false,
  //        // title: readProductsModel!.options![index].option,
  //        // price: readProductsModel!.options?[index].option_price ?? 0.0,
  //         btnClick: () {
  //           setState(() {
  //             isSelected = index;
  //           });
  //         },
  //       );
  //     },
  //     itemCount: readProductsModel!.options!.length,
  //   );
  // }

  Widget removeFromOrderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.flexibleWidth, vertical: 8.flexibleHeight),
          child: Text(
            'If not available',
            style: StyleText.mediumDarkGrey14,
            textAlign: TextAlign.start,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: removeItemReasonsList.length,
          itemBuilder: (context, index) {
            return RadioBtnListWidget(
              isGridView: true,
              isSelected: removeFromOrder == index ? true : false,
              title: removeItemReasonsList[index].name,
              btnClick: () {
                setState(() {
                  removeFromOrder = index;
                });
              },
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 25.flexibleHeight,
              crossAxisSpacing: 0.flexibleWidth,
              mainAxisSpacing: 3.flexibleHeight),
        ),
      ],
    );
  }

  Widget specialInstructions() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.flexibleWidth, vertical: 8.flexibleHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Special Instructions',
            style: StyleText.mediumDarkGrey14,
            textAlign: TextAlign.start,
          ),
          10.verticalSpace,
          instructionsFieldWidget(),
        ],
      ),
    );
  }

  Widget instructionsFieldWidget() {
    return Container(
      height: 50.flexibleHeight,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: UIColors.grayTwo,
            width: 1,
          )),
      child: TextFormFieldWidget(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter a valid email!';
          }
          return null;
        },
        textStyle: StyleText.mediumDarkGreySpacing14,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.emailAddress,
        hintStyle: StyleText.hintStyle,
        fillColor: UIColors.white,
        maxLine: 3,
        trbr: 6,
        tlbr: 6,
        blbr: 6,
        brbr: 6,
        trfbr: 6,
        tlfbr: 6,
        blfbr: 6,
        brfbr: 6,
        hcontentPadding: 19.flexibleWidth,
        vcontentPadding: 17.flexibleHeight,
      ),
    );
  }

  Widget addToCartBtnWidget(BuildContext context) {
    return SizedBox(
      height: 45.flexibleHeight,
      width: 230.flexibleWidth,
      child: ButtonWidget(
          btnClick: () async {
            // print(readProductsModel!.id);
            PreferenceUtils _preferenceUtils = locator<PreferenceUtils>();
            var user_id =
                await _preferenceUtils.getIntData(PreferenceKeys.USER_ID);

            final response = await ApiController.instance.AddTocart(
                category_id: productData["category_id"],
                store_id: productData['store_id'],
                produc_id: productData["id"],
                quantity: quantity!,
                user_id: user_id);
            print(response);

            if (response == "Null") {
              return Fluttertoast.showToast(
                  msg: 'Already Add To Cart ',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: UIColors.primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0);
              // Navigator.of(context)
              //                             .push(MaterialPageRoute(builder: (context)=>CartScreen()));
            } else if (response == "First Checkout Then Add New Store Order") {
              return Fluttertoast.showToast(
                  msg: 'First Checkout Then Add New Store Order',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: UIColors.primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
              return Fluttertoast.showToast(
                  msg: 'Add To Cart',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: UIColors.primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          btnText: 'ADD TO CART',
          brbottomRight: 6,
          brtopLeft: 6,
          brtopRight: 6,
          textStyle: StyleText.mediumWhite15),
    );
  }
}
