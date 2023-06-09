import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/cart/cart_screen.dart';
import 'package:zabardash/screens/home/home_screen.dart';
import 'package:zabardash/screens/orders/order_screen.dart';
import 'package:zabardash/screens/qr_scan/qr_scan_screen.dart';
import 'package:zabardash/screens/savings/savingreceipt.dart';
import 'package:zabardash/screens/savings/savings_screen.dart';

import '../cart/bottom_cart_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  static final routeName = '/bottom-navigation-screen';
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  void backToHome() {
    setState(() {
      _currrentIndex = 0;
    });
  }

  int _currrentIndex = 0;

  final List<Widget> _myWidget = [
    HomeScreen(),
    SavingsScreen(),
    SavingsRecipies(),
    BottomCartScreen(),
    OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: _myWidget[_currrentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: UIColors.white,
        selectedItemColor: UIColors.primaryColor,
        // selectedIconTheme: ,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            StyleText.regularDarkGray14.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: StyleText.regularDarkGray13,
        iconSize: 24.flexibleHeight,
        selectedIconTheme: IconThemeData(size: 28.flexibleHeight),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.savings_outlined,
            ),
            label: 'Savings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.savings_rounded,
            ),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.web,
            ),
            label: 'Orders',
          ),
        ],
        currentIndex: _currrentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currrentIndex = index;
    });
  }
}
