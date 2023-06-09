// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/core/di/dependency_injection.dart';
import 'package:zabardash/core/networking/api_manager.dart';
import 'package:zabardash/core/utils/pref_utils.dart';
import 'package:zabardash/core/utils/preference_keys.dart';
import 'package:zabardash/models/home_data_model/home_data_model.dart';
import 'package:zabardash/models/read_products_model/read_products_model.dart';
import 'package:zabardash/models/read_stores_model/read_stores_model.dart';
import 'package:zabardash/screens/home/home_widgets/export_widgets.dart';

class ApiController {
  ApiController._privateConstructor();

  static final ApiController instance = ApiController._privateConstructor();

  Future<List<ReadStoresModel>> readStores(
      {required double? lat, required double? lon}) async {
    try {
      final response =
          await ApiManager.instance.request('stores/', HttpMethod.GET, null);
      final list = (response.data as List)
          .map((e) => ReadStoresModel.fromJson(e))
          .toList();
      return list;
    } catch (e) {
      throw e;
    }
  }

  Future<List<ReadProductsModel>> readProducts({required int storeId}) async {
    try {
      final response = await ApiManager.instance
          .request('products/$storeId', HttpMethod.GET, null);
      final list = (response.data as List)
          .map((e) => ReadProductsModel.fromJson(e))
          .toList();
      return list;
    } catch (e) {
      throw e;
    }
  }

  AddTocart({
    required int produc_id,
    required int quantity,
    required int user_id,
    required int category_id,
    required int store_id,
  }) async {
    try {
      final response =
          await ApiManager.instance.request('getToCart/', HttpMethod.GET, null);

      print("Call Data123");
      // 17
      // 16
      // 17
      if (response.data.length == 0) {
        final params = {
          "id": int.parse(produc_id.toString() + user_id.toString()),
          "quantity": quantity,
          "product_id": produc_id,
          "userId": user_id,
          "store_id": store_id,
          "category_id": category_id,
        };
        final response = await ApiManager.instance
            .request('addToCart/', HttpMethod.POST, params, isFormData: false);
        print("call 123");
        print(response.data);

        return response;
      } else if (response.data[0]["store_id"] == store_id) {
        print("same store");
        final params = {
          "id": int.parse(produc_id.toString() + user_id.toString()),
          "quantity": quantity,
          "product_id": produc_id,
          "userId": user_id,
          "store_id": store_id,
          "category_id": category_id,
        };
        final response = await ApiManager.instance
            .request('addToCart/', HttpMethod.POST, params, isFormData: false);
        print("call 123");
        print(response.data);

        return response;
      } else {
        return "First Checkout Then Add New Store Order";
      }
    }
    //
    catch (e) {
      return "Null";
      // return    Fluttertoast.showToast(
      //       msg: 'Already Add to Cart',
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Color.fromARGB(255, 6, 121, 44),
      //       textColor: Colors.white,
      //       fontSize: 16.0);

    }
  }

  UpdateAddTocart({required Map Data}) async {
    try {
      final params = {
        "id": Data["id"],
        "quantity": Data["quantity"],
        "product_id": Data["product_id"],
        "userId": Data["User_Id"],
        "store_id": Data["store_id"],
        "category_id": Data["category_id"],
      };
      print(params);
      // // print(params.toString()+"jj");
      final response = await ApiManager.instance.request(
          'updateToCart/${Data["product_id"]}', HttpMethod.PUT, params,
          isFormData: false);
      print(response.data);

      return response;
    }
    //
    catch (e) {
      return "Null";
      // return    Fluttertoast.showToast(
      //       msg: 'Already Add to Cart',
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Color.fromARGB(255, 6, 121, 44),
      //       textColor: Colors.white,
      //       fontSize: 16.0);

    }
  }

  getallproduct() async {
    try {
      final response = await ApiManager.instance
          .request('getFeaturedProducts/', HttpMethod.GET, null);
      print(response.data);

      return response.data;
    } catch (e) {
      throw e;
    }
  }

  get_Store_Detail_Id(Store_Id) async {
    try {
      final response = await ApiManager.instance
          .request('stores/${Store_Id}', HttpMethod.GET, null);
      print(response.data);

      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Place_Order(all_list_cart, total_price, currentloc) async {
    try {
      final SharedPreferences prefe = await SharedPreferences.getInstance();
      var email = prefe.getString(PreferenceKeys.EMAIL)!;
      var user_Id = prefe.getInt(PreferenceKeys.USER_ID)!;
      print("User id :" + user_Id.toString());
      print("Email :" + email.toString());

      print("all_cart_data" + all_list_cart.toString());
      print("total_price" + total_price.toString());

      print(all_list_cart.length);

      var Card_Item = [];

      for (var j = 0; j < all_list_cart.length; j++) {
        print(all_list_cart[j].toString());
        Card_Item.add({
          "name": all_list_cart[j]["store_id"],
          "quantity": all_list_cart[j]["quantity"],
          "product_id": all_list_cart[j]["product_id"],
          "price": all_list_cart[j]["price"].toInt() *
              all_list_cart[j]["quantity"].toInt(),
          "productPicturePath": all_list_cart[j]["productPicturePath"],
          "store_id": all_list_cart[j]["store_id"],
          "category_id": all_list_cart[j]["category_id"],
          "isDelivered": "Order"
        });
      }
      print("card print :" + Card_Item.toString());

      final params = {
        "token": {
          "id": user_Id,
          "email": email,
          "card": {
            "address_line1": currentloc,
            "address_city": currentloc,
            "address_country": "string",
            "address_zip": "string"
          }
        },
        "cartItems": Card_Item,
        "currentUser": {
          "id": user_Id,
          "name": "string",
          "email": email,
          "is_staff": true,
          "is_active": true
        },
        "subtotal": total_price,
        "isDelivered": false
      };

      // print(params);
      print(params.toString() + "jj");
      final response = await ApiManager.instance
          .request('order/', HttpMethod.POST, params, isFormData: false);
      print(response);
      // print(response.data);

      return "SuccessFully Order Place";
    }
    //
    catch (e) {
      print(e);
      return "Null";
      // return    Fluttertoast.showToast(
      //       msg: 'Already Add to Cart',
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Color.fromARGB(255, 6, 121, 44),
      //       textColor: Colors.white,
      //       fontSize: 16.0);

    }
  }

  getMyOrderApi() async {
    try {
      final SharedPreferences prefe = await SharedPreferences.getInstance();
      var user_Id = prefe.getInt(PreferenceKeys.USER_ID)!;
      print("User id :" + user_Id.toString());

      //  final params = {"store_id": user_Id};

      final response = await ApiManager.instance
          .request('order/orderbyuser/${user_Id}', HttpMethod.GET, null);
      print(response);
      print("call data ");

      return response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  getAddTocart() async {
    try {
      final response =
          await ApiManager.instance.request('getToCart/', HttpMethod.GET, null);
      print("call data ");

      // final list = (response.data as List)
      //     .map((e) => ReadProductsMode.fromJson(e))
      //     .toList();
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  getRecpie() async {
    try {
      final response =
          await ApiManager.instance.request('getRecipt/', HttpMethod.GET, null);
      print("call data recipe");

      // final list = (response.data as List)
      //     .map((e) => ReadProductsMode.fromJson(e))
      //     .toList();
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  getSpecificRecpie(String? title) async {
    try {
      final response = await ApiManager.instance
          .request('getSpecificRecipt?title=$title', HttpMethod.GET, null);
      print("call data recipe");
      // ignore: unused_local_variable
      // var params = {"title": "Food"};
      // final list = (response.data as List)
      //     .map((e) => ReadProductsMode.fromJson(e))
      //     .toList();
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  getAllproduct() async {
    try {
      final response = await ApiManager.instance.request('getAllProduct', HttpMethod.GET, null);
      print("call data recipe");
      // ignore: unused_local_variable
      // var params = {"title": "Food"};
      // final list = (response.data as List)
      //     .map((e) => ReadProductsMode.fromJson(e))
      //     .toList();
      print(response.data);
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<HomeDataModel> homeData(
      {required double? lat, required double? lon}) async {
    try {
      final response = await ApiManager.instance
          .request('mobileHome?lat=$lat&lon=$lon', HttpMethod.GET, null);
      final homeData = HomeDataModel.fromJson(response.data);
      // print('HomeData: ${homeData}');
      return homeData;
    } catch (e) {
      throw e;
    }
  }

  GetCategory(store_id) async {
    try {
      final params = {"store_id": store_id};
      final response = await ApiManager.instance.request(
          'getCategoryStore/', HttpMethod.GET, params,
          isFormData: false);
      print(response.data);
      return response.data;
      // final homeData = HomeDataModel.fromJson(response.data);
      // print('HomeData: ${homeData}');
      // return homeData;
    } catch (e) {
      throw e;
    }
  }

  GetCategoryByStoreId(store_id) async {
    try {
      final params = {"store_id": store_id};
      final response = await ApiManager.instance.request(
          'getProductWithStoreID/', HttpMethod.GET, params,
          isFormData: false);
      print("resp" + response.data.toString());
      return response.data;
      // final homeData = HomeDataModel.fromJson(response.data);
      // print('HomeData: ${homeData}');
      // return homeData;
    } catch (e) {
      throw e;
    }
  }

  GetCategoryProduct(store_id, Category_id) async {
    try {
      final params = {"store_id": store_id, "category_id": Category_id};
      final response = await ApiManager.instance.request(
          'getProdCategoryStore/', HttpMethod.GET, params,
          isFormData: false);
      // print("resp"+response.data.toString());
      return response.data;
      // final homeData = HomeDataModel.fromJson(response.data);
      // print('HomeData: ${homeData}');
      // return homeData;
    } catch (e) {
      throw e;
    }
  }

// Future<bool> uploadDeviceToken(String token) async {
//   try {
//     final params = {
//       "token": token,
//     };
//     final response = await CCApiManager.instance.request(
//       "/api/token",
//       HttpMethod.POST,
//       AuthenticationType.POST,
//       params,
//     );
//     print("token uploaded sucessfully");
//     return true;
//   } catch (e) {
//     throw e;
//   }
// }
// Future<Employee?> sendEmployeeData(Employee employe) async {
//   try {
//     var employeeData = employe.toJson();
//     final response = await ApiManager.instance.request(
//       "/api/employee-form",
//       HttpMethod.POST,
//       employeeData,
//     );
//     final employee = Employee.fromJson(response.dataAsMap());
//     return employee;
//   } catch (e) {
//     print(e);
//     throw e;
//   }
// }

}
