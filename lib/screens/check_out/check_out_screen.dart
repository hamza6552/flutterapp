import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zabardash/common/widgets/button_widget.dart';
import 'package:zabardash/common/widgets/price_widget.dart';
import 'package:zabardash/core/utils/app_constants.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/check_out/widgets/shipping_information.dart';
import 'package:zabardash/screens/check_out/widgets/store_information.dart';
import 'package:zabardash/screens/order_success/order_sucess_screen.dart';
import 'package:zabardash/screens/orders/order_screen.dart';

import '../../core/networking/api_controller.dart';

// String ?total_price;
class CheckOutScreen extends StatefulWidget {
  var totalprice;
  var all_list_cart_product;
  CheckOutScreen(this.totalprice, this.all_list_cart_product);
  static const routeName = '/check-out-screen';
  //  CheckOutScreen({@required this.totalprice});

  @override
  _CheckOutScreenState createState() =>
      _CheckOutScreenState(totalprice, all_list_cart_product);
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String? totalprice;
  var all_list_cart_product;
  _CheckOutScreenState(this.totalprice, this.all_list_cart_product);
  bool isDelivery = false;
  bool pickAreaToggle = false;
  int _radioSelected = 1;

  var _currentAddress = "";

  var store_Address = "";
  var mian_user_loc = "";
  var title = "";

  void initState() {
    super.initState();
    _getCurrentPosition();
    // print("data"+totalprice.toString());
    // print("list "+all_list_cart_product[0]["store_id"].toString());
    get_store_detail(all_list_cart_product[0]["store_id"]);
  }

  get_store_detail(Store_Id) async {
    print("Get All Data :" + all_list_cart_product.toString());
    // print("Store Id"+Store_Id.toString());
    final response = await ApiController.instance.get_Store_Detail_Id(Store_Id);
    print(response["address"].toString());

    store_Address = response["address"].toString();
    title = response["title"];
    setState(() {});
  }

  place1_Order() async {
    // all_list_cart_product,
    // total_price
    print("Call 123");
    final response = await ApiController.instance
        .Place_Order(all_list_cart_product, totalprice, _currentAddress);

    if (response == "SuccessFully Order Place") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
      return Fluttertoast.showToast(
          msg: 'SuccessFully Add To Card',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: UIColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<Position?> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    // final hasPermission = await _determinePosition();

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      print(position);
      _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        // mian_user_loc = place.st;
        _currentAddress = '${place.name}, ${place.subLocality}';
      });
      print(place);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // _CheckOutScreenState(String? totalprice);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout',
          style: StyleText.mediumDarkGrey17,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: UIColors.darkGray1,
          ),
        ),
      ),
      body: _currentAddress == ""
          ? Center(child: CircularProgressIndicator())
          : _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.flexibleWidth, vertical: 10.flexibleHeight),
        child: Column(
          children: [
            10.verticalSpace,
            topSelectionButtons(),
            20.verticalSpace,
            isDelivery ? _deliveryWidget() : _pickupWidget(),
            20.verticalSpace,
            _paymentOptions(),
            20.verticalSpace,
            PriceWidget(
              isShowBottomSheet: false,
              total_price: totalprice.toString(),
              onbttomShetIconPressed: () {},
            ),
            20.verticalSpace,
            checkOutBtnWidget(context)
          ],
        ),
      ),
    );
  }

  topSelectionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isDelivery = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color:
                      isDelivery ? UIColors.primaryColor : UIColors.halfLight,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Delivery",
                  style: isDelivery
                      ? StyleText.mediumWhite16
                      : StyleText.mediumWhite16.copyWith(
                          color: UIColors.primaryColor,
                          fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isDelivery = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: isDelivery == false
                      ? UIColors.primaryColor
                      : UIColors.halfLight,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Pickup",
                  style: isDelivery == false
                      ? StyleText.mediumWhite16
                      : StyleText.mediumWhite16
                          .copyWith(color: UIColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _pickupWidget() {
    return Column(
      children: [
        Container(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // elevation: 1,
          // shadowColor: UIColors.halfLight,
          decoration: BoxDecoration(
            color: UIColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [AppConstants.containerShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Store Information",
                  style: StyleText.mediumDarkGrey16,
                ),
                10.verticalSpace,
                _textWithIcon(title, "assets/images/user_checkout.png"),
                10.verticalSpace,
                _textWithIcon(
                    store_Address, "assets/images/location_checkout.png"),
                10.verticalSpace,
                _textWithIcon(
                    "408-8585-4545", "assets/images/mobile_checkout.png")
              ],
            ),
          ),
        ),
        10.verticalSpace,
        _pickUpArea()
      ],
    );
  }

  _deliveryWidget() {
    return Column(
      children: [
        ShippingInformation(),
        10.verticalSpace,
        _deliveryInstruction()
      ],
    );
  }

  _pickUpArea() {
    return Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // elevation: 1,
      // shadowColor: UIColors.halfLight,
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [AppConstants.containerShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Pickup Area",
              style: StyleText.mediumDarkGrey16,
            ),
            10.verticalSpace,
            Container(
              height: 50,
              child: Row(
                children: [
                  _textWithIcon(_currentAddress, "assets/images/delivery.png"),
                  Spacer(),
                  FlutterSwitch(
                    width: 50.0,
                    height: 25.0,
                    valueFontSize: 25.0,
                    toggleSize: 30.0,
                    value: pickAreaToggle,
                    borderRadius: 30.0,
                    toggleColor: Colors.red,
                    switchBorder: Border.all(
                      color: UIColors.primaryColor,
                      width: 1.0,
                    ),
                    activeColor: Colors.white,
                    inactiveColor: Colors.white,
                    padding: 2.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        pickAreaToggle = val;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _deliveryInstruction() {
    return Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // elevation: 1,
      // shadowColor: UIColors.halfLight,
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [AppConstants.containerShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  "Pickup Area",
                  style: StyleText.mediumDarkGrey16,
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 1,
                    shadowColor: UIColors.halfLight,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image(
                        image: AssetImage(
                          "assets/images/edit_icon_black.png",
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            10.verticalSpace,
            _textWithIcon("Add delivery instructions..... (Optional)",
                "assets/images/delivery.png"),
          ],
        ),
      ),
    );
  }

  _paymentOptions() {
    return Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // elevation: 1,
      // shadowColor: UIColors.halfLight,
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [AppConstants.containerShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment",
              style: StyleText.mediumDarkGrey16,
            ),
            Row(
              children: [
                _textWithIcon(
                    "Credit or debit card", "assets/images/card_checkout.png"),
                Spacer(),
                Radio(
                  value: 1,
                  groupValue: _radioSelected,
                  fillColor:
                      MaterialStateProperty.all<Color>(UIColors.primaryColor),
                  onChanged: (newValue) => setState(() => {}),
                  activeColor: UIColors.primaryColor,
                ),
              ],
            ),
            Row(
              children: [
                _textWithIcon(
                    "Cash on Pickup", "assets/images/cash_checkout.png"),
                Spacer(),
                SizedBox(
                  height: 24,
                  child: Theme(
                    data:
                        ThemeData(unselectedWidgetColor: UIColors.primaryColor),
                    child: Radio(
                      value: 2,
                      groupValue: _radioSelected,
                      onChanged: (newValue) => setState(() => {}),
                      activeColor: UIColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget checkOutBtnWidget(BuildContext context) {
    return SizedBox(
      height: 45.flexibleHeight,
      width: 230.flexibleWidth,
      child: ButtonWidget(
          btnClick: () {
            // Navigator.of(context).pushNamed(OrderSuccessScreen.routeName);
            place1_Order();
          },
          btnText: 'PLACE ORDER',
          brbottomRight: 6,
          brtopLeft: 6,
          brtopRight: 6,
          textStyle: StyleText.mediumWhite15),
    );
  }

  _textWithIcon(String text, String icon) {
    return Row(
      children: [
        Image(
          image: AssetImage(icon),
          height: 24.flexibleHeight,
          width: 24.flexibleWidth,
        ),
        5.horizontalSpace,
        Text(
          text,
          style: StyleText.regularLightGray15,
        )
      ],
    );
  }
}
