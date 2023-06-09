import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/app_selection_widget.dart';
import 'package:zabardash/common/widgets/popup_product_categories.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/savings/savingproductlsit.dart';
import 'package:zabardash/screens/savings_product/savings_product_screen.dart';

import '../../dummy_data.dart';

class SavingsScreen extends StatefulWidget {
  static const routeName = '/savings-screen';
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  int isSelected = 0;

  var items = [
    {
      "name": "Drink",
      "signature_pic":
          "https://th.bing.com/th?id=OIP.bvqeN-L3LUD_9OfeFuFdcAHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      "item": [
        {
          "name": "Coca Cola",
          "signature_pic":
              "https://th.bing.com/th?id=OIP.bvqeN-L3LUD_9OfeFuFdcAHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.HAw15EMvbO3pSTkTbOS7GwHaHa?w=167&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://th.bing.com/th/id/OIP.g34QBnIX87u9KMJ4fI3GGQHaE7?w=297&h=198&c=7&r=0&o=5&pid=1.7"
        },
        {
          "name": "sting",
          "signature_pic":
              "https://th.bing.com/th?id=OIP.bvqeN-L3LUD_9OfeFuFdcAHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.xL1tJuUFmYB86tggg6YSjAAAAA?w=167&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://www.bing.com/th?id=OIP.4ZeOI6N6X4nnJc_LTGAAQgHaJE&w=150&h=184&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
        },
        {
          "name": "pepsi",
          "signature_pic":
              "https://th.bing.com/th?id=OIP.bvqeN-L3LUD_9OfeFuFdcAHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "Nutientpic":
              "https://th.bing.com/th?q=Nutrition+in+Diet+Pepsi&w=120&h=120&c=1&rs=1&qlt=90&cb=1&pid=InlineBlock&mkt=en-WW&cc=PK&setlang=en&adlt=moderate&t=1&mw=247",
          "imagepic":
              "https://www.bing.com/th?id=OIP.H94N6AwPyEoPyYh9d24c8gHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"
        },
      ]
    },
    {
      "name": "Masala",
      "signature_pic":
          "https://th.bing.com/th?id=OIP.ZfLK8UMLRg-02frLwwLuEAAAAA&w=275&h=186&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      "item": [
        {
          "signature_pic":
              "https://th.bing.com/th?id=OIP.ZfLK8UMLRg-02frLwwLuEAAAAA&w=275&h=186&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "name": "Briyani Masala",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.9JpHRLeLKD1SHyY2V8ZyVAHaHa?w=192&h=192&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://th.bing.com/th/id/OIP.ZHIds66Wr3R5aZctC0elSAHaHa?w=192&h=192&c=7&r=0&o=5&pid=1.7"
        },
        {
          "name": "Niyari Masala",
          "signature_pic":
              "https://th.bing.com/th?id=OIP.ZfLK8UMLRg-02frLwwLuEAAAAA&w=275&h=186&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.uydpabek38Yie9QT419UnwHaHa?w=172&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://th.bing.com/th/id/OIP.PTd0R3n9OLxPcWKx4KaXfgHaGG?w=218&h=180&c=7&r=0&o=5&pid=1.7"
        },
        {
          "name": "Chaat Masala",
          "signature_pic":
              "https://th.bing.com/th?id=OIP.ZfLK8UMLRg-02frLwwLuEAAAAA&w=275&h=186&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.KkCXpLO-uOevqqYgkwXbUQHaL0?w=115&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://th.bing.com/th?q=National+Chaat+Masala&w=120&h=120&c=1&rs=1&qlt=90&cb=1&pid=InlineBlock&mkt=en-WW&cc=PK&setlang=en&adlt=moderate&t=1&mw=247"
        },
      ]
    },
    {
      "name": "Dairy Items",
      "signature_pic":
          "https://www.dairyfoods.com/ext/resources/2022/10/27/Dairy-Products.jpeg?1666879344",
      "item": [
        {
          "signature_pic":
              "https://www.dairyfoods.com/ext/resources/2022/10/27/Dairy-Products.jpeg?1666879344",
          "name": "Milk",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.9JpHRLeLKD1SHyY2V8ZyVAHaHa?w=192&h=192&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://www.thespruceeats.com/thmb/Dk1kSV4VrhMMydNQ1aahuFcOCho=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/potato-milk-5218684-hero-03-9bd26d6a5fd34025b072f6256e039652.jpg"
        },
        {
          "name": "Eggs",
          "signature_pic":
              "https://www.dairyfoods.com/ext/resources/2022/10/27/Dairy-Products.jpeg?1666879344",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.uydpabek38Yie9QT419UnwHaHa?w=172&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://post.healthline.com/wp-content/uploads/2020/05/eggs-counter-1200x628-facebook-1200x628.jpg"
        },
        {
          "name": "Cheese",
          "signature_pic":
              "https://www.dairyfoods.com/ext/resources/2022/10/27/Dairy-Products.jpeg?1666879344",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.KkCXpLO-uOevqqYgkwXbUQHaL0?w=115&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthiest-cheese-1296x728-swiss.jpg"
        },
      ]
    },
    {
      "name": "Herbs",
      "signature_pic":
          "https://www.thespruceeats.com/thmb/GFvSucJcAVCi2WNtsmLh8I3Sbkw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/various-fresh-herbs-907728974-cc6c2be53aac46de9e6a4b47a0e630e4.jpg",
      "item": [
        {
          "signature_pic":
              "https://www.thespruceeats.com/thmb/GFvSucJcAVCi2WNtsmLh8I3Sbkw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/various-fresh-herbs-907728974-cc6c2be53aac46de9e6a4b47a0e630e4.jpg",
          "name": "Mint",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.9JpHRLeLKD1SHyY2V8ZyVAHaHa?w=192&h=192&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://assets.epicurious.com/photos/5763132cff66dde1456dfed0/16:9/w_2560%2Cc_limit/Mint_Leaves.jpg"
        },
        {
          "name": "Coriander",
          "signature_pic":
              "https://www.thespruceeats.com/thmb/GFvSucJcAVCi2WNtsmLh8I3Sbkw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/various-fresh-herbs-907728974-cc6c2be53aac46de9e6a4b47a0e630e4.jpg",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.uydpabek38Yie9QT419UnwHaHa?w=172&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://www.tazaonline.com/wp-content/uploads/2022/02/herb-coriander-5.jpg"
        },
        {
          "name": "Basil Leaves",
          "signature_pic":
              "https://www.thespruceeats.com/thmb/GFvSucJcAVCi2WNtsmLh8I3Sbkw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/various-fresh-herbs-907728974-cc6c2be53aac46de9e6a4b47a0e630e4.jpg",
          "Nutientpic":
              "https://th.bing.com/th/id/OIP.KkCXpLO-uOevqqYgkwXbUQHaL0?w=115&h=180&c=7&r=0&o=5&pid=1.7",
          "imagepic":
              "https://media.naheed.pk/catalog/product/cache/49dcd5d85f0fa4d590e132d0368d8132/1/1/1168910-1.jpg"
        },
      ]
    }
  ];

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
          itemCount: items.length,
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
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
          child: GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16.flexibleHeight),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _savingsProducts(items[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200.flexibleHeight,
                crossAxisSpacing: 10.flexibleWidth,
                mainAxisSpacing: 10.flexibleHeight),
          )),
    );
  }

  _savingsProducts(storeItems) {
    return GestureDetector(
      onTap: () => {
        // print(storeItems)/
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SavingPrdouct(storeItems)))
      },
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
            imageUrl: storeItems["signature_pic"],
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
