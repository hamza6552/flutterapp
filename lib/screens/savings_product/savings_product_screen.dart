import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/app_selection_widget.dart';
import 'package:zabardash/common/widgets/popup_product_categories.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

import '../../dummy_data.dart';

class SavingsProductScreen extends StatefulWidget {
  static const routeName = '/savings-product-screen';

  var storeitem;
  SavingsProductScreen(this.storeitem);
  // const SavingsProductScreen({Key? key}) : super(key: key);

  @override
  State<SavingsProductScreen> createState() =>
      _SavingsProductScreenState(storeitem);
}

class _SavingsProductScreenState extends State<SavingsProductScreen> {
  var storeitem;

  _SavingsProductScreenState(this.storeitem);

  int isSelected = 0;

  void initState() {
    super.initState();
    print(storeitem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _topWidget(context),
          _titleWidget(),
          _productDescription(),
          _productAvailableStoreTitle(),
          _storeItemList(),
        ],
      ),
    );
  }

  _topWidget(BuildContext context) {
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
        ],
      ),
    );
  }

  _titleWidget() {
    return CachedNetworkImage(
      imageUrl: storeitem["signature_pic"],
      imageBuilder: (context, imageProvider) {
        return Container(
          width: double.infinity,
          height: 120.flexibleHeight,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
              horizontal: 16.flexibleWidth, vertical: 20.flexibleHeight),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      placeholder: (context, url) => ShimmerEffect(
        height: 120.flexibleHeight,
        width: double.infinity,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  _productDescription() {
    return SizedBox(
      height: 180.flexibleHeight,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
          child: GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 0.flexibleHeight),
            itemCount: storeitem.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? _productDescriptionTile(storeitem["imagepic"])
                  : _productDescriptionTile(storeitem["Nutientpic"]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 180.flexibleHeight,
                crossAxisSpacing: 10.flexibleWidth,
                mainAxisSpacing: 10.flexibleHeight),
          )),
    );
  }

  _productDescriptionTile(dynamic value) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 182.flexibleWidth,
        height: 210.flexibleHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: UIColors.white,
            boxShadow: [
              BoxShadow(
                color: UIColors.shadowGrey,
                blurRadius: 12,
                spreadRadius: -10,
                // spreadRadius:1,
              ),
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: value,
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

  _productAvailableStoreTitle() {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.flexibleWidth,
          right: 28.flexibleWidth,
          top: 10.flexibleHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available in these stores',
            style: StyleText.regularDarkGray14,
          ),
          SizedBox(
            width: 42.flexibleWidth,
            child: Divider(
              height: 9,
              color: UIColors.primaryColor,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }

  _storeItemList() {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
          child: GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16.flexibleHeight),
            itemCount: 4,
            itemBuilder: (context, index) {
              return index != 1
                  ? _storeItemTile()
                  : _storeItemTileUnavailable();
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 130.flexibleHeight,
                crossAxisSpacing: 10.flexibleWidth,
                mainAxisSpacing: 10.flexibleHeight),
          )),
    );
  }

  _storeItemTile() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 182.flexibleWidth,
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
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: 4.flexibleWidth,
                    left: 4.flexibleWidth,
                    top: 12.flexibleHeight),
                child: Text(
                  'Chatta Super Halal Market',
                  style: StyleText.mediumDarkGrey14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(flex: 1),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.flexibleWidth,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '633 E. Courtland Street North Andover, MA 01845',
                        style: StyleText.regularLightGray11,
                      ),
                    ),
                    SizedBox(
                      width: 12.flexibleWidth,
                    ),
                    Expanded(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                            text: '1.6 miles away',
                            style:
                                StyleText.boldDarkGray11.copyWith(height: 1.2),
                            children: [
                              TextSpan(
                                text: '\nCloses at 9pm',
                                style: StyleText.boldprimary11
                                    .copyWith(height: 1.3),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.flexibleWidth),
                    child: Text('\$4.99', style: StyleText.boldDarkGrey20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: UIColors.dotGray,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Open Store',
                      style: StyleText.boldPrimary12,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  _storeItemTileUnavailable() {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
              width: 182.flexibleWidth,
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: 4.flexibleWidth,
                        left: 4.flexibleWidth,
                        top: 12.flexibleHeight),
                    child: Text(
                      'Chatta Super Halal Market',
                      style: StyleText.mediumDarkGrey14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.flexibleWidth,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '633 E. Courtland Street North Andover, MA 01845',
                            style: StyleText.regularLightGray11,
                          ),
                        ),
                        SizedBox(
                          width: 12.flexibleWidth,
                        ),
                        Expanded(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                                text: '1.6 miles away',
                                style: StyleText.boldDarkGray11
                                    .copyWith(height: 1.2),
                                children: [
                                  TextSpan(
                                    text: '\nCloses at 9pm',
                                    style: StyleText.boldprimary11
                                        .copyWith(height: 1.3),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.flexibleWidth),
                        child: Text('\$4.99', style: StyleText.boldDarkGrey20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: UIColors.dotGray,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Open Store',
                          style: StyleText.boldPrimary12,
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(
            width: 182.flexibleWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: UIColors.shadowGrey.withOpacity(0.8),
            ),
            child: Center(
              child: Text(
                'UNAVAILABLE',
                style: StyleText.mediumWhite16.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
