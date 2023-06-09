import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zabardash/common/widgets/app_selection_widget.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/networking/api_controller.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/dummy_data.dart';
import 'package:zabardash/location.dart';
import 'package:zabardash/screens/bottom_navigation/bottom_navigation_widget.dart';
import 'package:zabardash/screens/home/home_screen.dart';
import 'package:zabardash/screens/orders/widgets/order_view.dart';
import 'package:zabardash/screens/orders_detail/orders_detail.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders-screen';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int isSelected = 0;

  var product_List = [];

  void initState() {
    super.initState();
    callMyOrderApi();
  }

  callMyOrderApi() async {
    var response = await ApiController.instance.getMyOrderApi();
    print(response.data["orderItems"]);
    for (var i = 0; i < response.data["orderItems"].length; i++) {
      print(response.data["orderItems"][i]["product_id"]);
      print("c" + response.data["orderItems"][i].toString());

      final response1 = await ApiController.instance.GetCategoryProduct(
          response.data["orderItems"][i]["store_id"],
          response.data["orderItems"][i]["category_id"]);

      for (var j = 0; j < response1.length; j++) {
        if (response1[j]["id"].toInt() ==
            int.parse(response.data["orderItems"][i]["product_id"])) {
          print(response.data["orderItems"][i]);
          // product_List.add(response1[j]);
          var main_List = {
            "id": response1[j]["id"],
            "productPicturePath": response1[j]["productPicturePath"],
            "price": response1[j]["price"],
            "store_id": response1[j]["store_id"],
            "category_id": response1[j]["category_id"],
            "description": response1[j]["description"],
            "user_id": response.data["orderItems"][i]["order_id"],
            "order_price": response.data["orderItems"][i]["price"],
            "product_id": response.data["orderItems"][i]["product_id"],
            "quantity": response.data["orderItems"][i]["quantity"],
            "isDelivered": response.data["orderItems"][i]["isDelivered"]
          };
          product_List.add(main_List);
        }
      }
      print(product_List);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
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
        backgroundColor: UIColors.white,
        title: Text(
          'Orders',
          style:
              StyleText.regularDarkGray18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.flexibleWidth),
      child: Column(
        children: [
          searchFieldWidget(),
          10.verticalSpace,
          _orderStatusList(context),
          5.verticalSpace,
          Expanded(
            child: ListView.builder(
                itemCount: product_List.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              OrdersDetail(product_List[index])));
                    },
                    child: OrderView(
                      product_List[index],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  _orderStatusList(BuildContext context) {
    return Container(
      height: 45,
      child: ListView.builder(
          itemCount: orderStatus.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container();
            // return Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
            //   child: Container(
            //     title: orderStatus[index],
            //     textStyle: isSelected== index ?  StyleText.regularWhite16
            //         : StyleText.regularWhite16
            //         .copyWith(color: UIColors.primaryColor),
            //     isSelected: isSelected ==index ? true : false,
            //     borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(8),
            //         topLeft: Radius.circular(8),
            //         bottomRight: Radius.circular(8)),
            //     btnClick: (){
            //     setState(() {
            //       isSelected = index;
            //     });

            //     },
            //   ),
            // );
          }),
    );
  }

  Widget searchFieldWidget() {
    return Padding(
      padding:
          EdgeInsets.only(top: 8.7.flexibleHeight, bottom: 10.flexibleHeight),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: UIColors.shadowGrey,
              blurRadius: 16,
              spreadRadius: -10,
              offset: Offset(0, 2)
              // spreadRadius:1,
              ),
        ]),
        child: TextFormFieldWidget(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter a valid search!';
            }
            return null;
          },
          textStyle: StyleText.mediumDarkGreySpacing14,
          textInputAction: TextInputAction.next,
          hintText: 'Search for stores, products & deals',
          hintStyle: StyleText.regularLightGray14,
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
                  left: 17.1.flexibleWidth, right: 16.9.flexibleWidth),
              child: Icon(
                Icons.search,
                color: UIColors.primaryColor,
                size: 24.flexibleHeight,
              )),
        ),
      ),
    );
  }
}
