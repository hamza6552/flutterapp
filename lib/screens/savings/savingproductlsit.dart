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
import 'package:zabardash/screens/savings_product/savings_product_screen.dart';

import '../../dummy_data.dart';

class SavingPrdouct extends StatefulWidget {
  // static const routeName = '/savings-screen';
  var storeItem;
  SavingPrdouct(this.storeItem);
  // const SavingPrdouct({Key? key}) : super(key: key);

  @override
  State<SavingPrdouct> createState() => _SavingPrdouctState(storeItem);
}

class _SavingPrdouctState extends State<SavingPrdouct> {
  var storeItem;
  _SavingPrdouctState(this.storeItem);

  void initState() {
    super.initState();
    print(storeItem["item"][0]);
  }

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          topWidget(context),
          titleWidget(),
          productStatusListWidget(),
          productItemList()
        ],
      ),
    );
  }

  Widget topWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.flexibleWidth,
          top: 40.flexibleHeight,
          right: 20.flexibleWidth),
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
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.file_upload_outlined,
              color: UIColors.darkGray,
              size: 20.flexibleHeight,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
  // Widget topWidget(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //         left: 16.flexibleWidth,
  //         top: 40.flexibleHeight,
  //         right: 16.flexibleWidth),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Expanded(
  //           child: Stack(
  //             children: [

  //               Container(
  //                 height: 45.flexibleHeight,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(6),
  //                         topRight: Radius.circular(6),
  //                         bottomLeft: Radius.circular(6)),
  //                     boxShadow: [
  //                       BoxShadow(
  //                           color: UIColors.shadowGrey,
  //                           blurRadius: 16,
  //                           spreadRadius: -10,
  //                           offset: Offset(0, 2)
  //                           // spreadRadius:1,
  //                           ),
  //                     ]),
  //               ),
  //               SizedBox(
  //                 height: 45.flexibleHeight,
  //                 child: TextFormFieldWidget(
  //                   validator: (value) {
  //                     if (value!.isEmpty) {
  //                       return 'Enter a valid search!';
  //                     }
  //                     return null;
  //                   },
  //                   textStyle: StyleText.mediumDarkGreySpacing14,
  //                   textInputAction: TextInputAction.next,
  //                   hintText: 'Search within store',
  //                   hintStyle: StyleText.regularLightGray13,
  //                   fillColor: UIColors.white,
  //                   trbr: 6,
  //                   tlbr: 6,
  //                   blbr: 6,
  //                   trfbr: 6,
  //                   tlfbr: 6,
  //                   blfbr: 6,
  //                   hcontentPadding: 19.flexibleWidth,
  //                   vcontentPadding: 17.flexibleHeight,
  //                   prefixIcon: Padding(
  //                       padding: EdgeInsets.only(
  //                           left: 17.1.flexibleWidth,
  //                           right: 16.9.flexibleWidth),
  //                       child: Icon(
  //                         Icons.search,
  //                         color: UIColors.primaryColor,
  //                         size: 24.flexibleHeight,
  //                       )),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(left: 20.flexibleWidth),
  //           child: IconButton(
  //             padding: EdgeInsets.zero,
  //             constraints: BoxConstraints(),
  //             icon: Icon(
  //               Icons.file_upload_outlined,
  //               color: UIColors.darkGray,
  //               size: 20.flexibleHeight,
  //             ),
  //             onPressed: () {
  //               showDialog<void>(
  //                 context: context,
  //                 builder: (BuildContext context) {
  //                   return PopupProductCateogries();
  //                 },
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget titleWidget() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
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
            children: [
              Text(
                'ZABARDASH',
                style: StyleText.mediumWhite16.copyWith(
                  letterSpacing: 1.3,
                ),
              ),
              11.verticalSpace,
              Text('SAVINGS',
                  style: StyleText.mediumWhite24
                      .copyWith(letterSpacing: 1.3, color: UIColors.yellow)),
            ],
          ),
        ),
        Positioned(
          right: 80.flexibleWidth,
          top: 18.flexibleHeight,
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

  Widget productStatusListWidget() {
    return Container(
      height: 40.flexibleHeight,
      margin: EdgeInsets.only(bottom: 10.flexibleHeight),
      child: ListView.builder(
          itemCount: storeStatus.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 20.flexibleWidth),
          itemBuilder: (context, index) {
            return Container();
            // Padding(
            //   padding: EdgeInsets.only(right: 20.flexibleWidth),
            //   child: SelectionContainer(
            //     title: storeStatus[index],
            //     textStyle: isSelected == index
            //         ? StyleText.regularWhite16
            //         : StyleText.regularWhite16
            //             .copyWith(color: UIColors.primaryColor),
            //     isSelected: isSelected == index ? true : false,
            //     borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(8),
            //         topLeft: Radius.circular(8),
            //         bottomRight: Radius.circular(8)),
            //     btnClick: () {
            //       setState(() {
            //         isSelected = index;
            //       });
            //     },
            //   ),
            // );
          }),
    );
  }

  Widget productItemList() {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.all(10),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200.flexibleHeight,
                  crossAxisSpacing: 10.flexibleWidth,
                  mainAxisSpacing: 10.flexibleHeight),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 16.flexibleHeight),
              itemCount: storeItem["item"].length,
              itemBuilder: (context, index) {
                return _savingsProducts(storeItem["item"][index]);
              },
            )),
      ),
    );
  }

  _savingsProducts(storeItems) {
    print(storeItems["name"]);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SavingsProductScreen(storeItems))),
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.all(25),
            width: MediaQuery.of(context).size.width,
            // width: 182.flexibleWidth,
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
                fit: BoxFit.contain,
                imageUrl: storeItems["imagepic"],
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
          Positioned(
            // top: .flexibleWidth,
            left: 1.flexibleWidth,
            bottom: 20,
            child: Container(
              height: 32.flexibleHeight,
              width: 189.flexibleWidth,
              margin: EdgeInsets.only(left: 16.flexibleWidth),
              child: ButtonWidget(
                  btnClick: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SavingsProductScreen(storeItems)));
                    // Navigator.of(context)
                    //     .pushNamed(SavingsProductScreen.routeName);
                  },
                  btnText: storeItems["name"],
                  brbottomRight: 6,
                  brtopLeft: 6,
                  textStyle: StyleText.regularDarkGrey13.copyWith(
                      fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            ),
          ),
        ],
      ),
    );
  }
}
