import 'package:flutter/material.dart';
import 'package:zabardash/location.dart';
import 'package:zabardash/screens/bottom_navigation/bottom_navigation_widget.dart';
import 'package:zabardash/screens/cart/cart_screen.dart';
import 'package:zabardash/screens/check_out/check_out_screen.dart';
import 'package:zabardash/screens/feature_product/feature_product_screen.dart';
import 'package:zabardash/screens/home/home_screen.dart';
import 'package:zabardash/screens/login/login_screen.dart';
import 'package:zabardash/screens/onboarding/onboarding_screen.dart';
import 'package:zabardash/screens/order_success/order_sucess_screen.dart';
import 'package:zabardash/screens/orders/order_screen.dart';
import 'package:zabardash/screens/orders_detail/orders_detail.dart';
import 'package:zabardash/screens/product_detail/product_details_screen.dart';
import 'package:zabardash/screens/qr_scan/qr_scan_screen.dart';
import 'package:zabardash/screens/savings/savingrecepitproduct.dart';
import 'package:zabardash/screens/savings/savings_screen.dart';
import 'package:zabardash/screens/savings_product/savings_product_screen.dart';
import 'package:zabardash/screens/signup/signup_screen.dart';
import 'package:zabardash/screens/splash/splash_screen.dart';
import 'package:zabardash/screens/store/store_screen.dart';

final Map<String, Widget Function(BuildContext)> AppRoutes = {
  '/': (_) => SplashScreen(),
  LoginScreen.routeName: (_) => LoginScreen(),
  OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
  SignupScreen.routeName: (_) => SignupScreen(),
  HomeScreen.routeName: (_) => HomeScreen(),
  SavingsScreen.routeName: (_) => SavingsScreen(),
  // QrScanScreen.routeName: (_) => QrScanScreen(),
  CartScreen.routeName: (_) => CartScreen(),
  OrderScreen.routeName: (_) => OrderScreen(),
  // HomePages.routeName: (_) => HomePages(),
  BottomNavigationScreen.routeName: (_) => BottomNavigationScreen(),
  // FeatureProductScreen.routeName: (_) => FeatureProductScreen([]),
  StoreScreen.routeName: (_) => StoreScreen(),
  CheckOutScreen.routeName: (_) => CheckOutScreen("", []),
  OrderSuccessScreen.routeName: (_) => OrderSuccessScreen(),
  ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
  OrdersDetail.routeName: (_) => OrdersDetail(""),
  SavingsProductScreen.routeName: (_) => SavingsProductScreen(""),
};
