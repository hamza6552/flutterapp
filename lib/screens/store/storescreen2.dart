import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/common/widgets/popup_product_categories.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/common/widgets/shimmer_widgets/store_screen_shimmer.dart';
import 'package:zabardash/common/widgets/store_item_widget.dart';
import 'package:zabardash/common/widgets/textfield_widget.dart';
import 'package:zabardash/core/networking/api_controller.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/showErrorAlert.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/dummy_data.dart';
import 'package:zabardash/models/read_products_model/read_products_model.dart';
import 'package:zabardash/screens/home/home_screen.dart';
import 'package:zabardash/screens/product_detail/product_details_screen.dart';
import 'package:zabardash/screens/store/store_bloc/store_cubit.dart';

import '../../models/home_data_model/home_data_model.dart';
import '../bottom_navigation/bottom_navigation_widget.dart';

class StoreScreen2 extends StatefulWidget {
  var StoreDetail;
  StoreScreen2(this.StoreDetail);

  static const routeName = '/store-screen';

  // const StoreScreen2({Key? key}) : super(key: key);

  @override
  _StoreScreen2State createState() => _StoreScreen2State(StoreDetail);
}

class _StoreScreen2State extends State<StoreScreen2> {
  var StoreDetail;
  _StoreScreen2State(this.StoreDetail);
  int isSelected = 0;

  List Category = [];

  @override
  void initState() {
    super.initState();
    print(StoreDetail["storePicturePath"]);
    readProducts();
    GetCategory();
    getFirstTime();
    
  }

  var Product_cat = [];

  Get_Product_Category(StoreId, categoryId) async {
    
    Product_cat = [];
    if (categoryId == " ") {
      final response =
          await ApiController.instance.GetCategoryByStoreId(StoreId);

      print(response);

      for (var i = 0; i < response.length; i++) {
        print(response[i]);
        Product_cat.add(response[i]);
      }
    } else {
      print("store_id" + StoreId.toString());
      print("category_id" + categoryId.toString());

      final response =
          await ApiController.instance.GetCategoryProduct(StoreId, categoryId);

      print(response);

      for (var i = 0; i < response.length; i++) {
        print(response[i]);
        Product_cat.add(response[i]);
        // Category.add(response[i]);
      }
    }

    setState(() {});
  }

getFirstTime() async{

    Product_cat = [];
       final prefs = await SharedPreferences.getInstance();
    var storeId = prefs.getInt("Store_Id");
      final response =
          await ApiController.instance.GetCategoryByStoreId(storeId);

      print(response);

      for (var i = 0; i < response.length; i++) {
        print(response[i]);
        Product_cat.add(response[i]);
      }
     
   

    setState(() {});
  }


  GetCategory() async {
    // print("id"+_storeDataModel?.id.toString());
    final prefs = await SharedPreferences.getInstance();
    var storeId = prefs.getInt("Store_Id");

    final response = await ApiController.instance.GetCategory(storeId);
    print("Dtaa :" + response.runtimeType.toString());
    for (var i = 0; i < response.length; i++) {
      if (i == 0) {
        Category.add({
          "title": "All",
          "is_active": true,
          "storeid": storeId,
          "cateogryPicturePath": "string",
          "id": " "
        });
      }
      print(response[i]);
      Category.add(response[i]);
    }
    setState(() {});
  }

  void readProducts() async {
    // Future.delayed(Duration.zero).then((value) {
    //   _storeDataModel =
    //       ModalRoute.of(context)!.settings.arguments as StoreDataModel;
    //   print("c" + _storeDataModel.toString());
    // });
    // await _storeCubit!.readProducts();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final itemHeight =
    // (
    // size.height - kToolbarHeight - 24 - (size.height * 0.2)) / 2;
    final itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: Column(
        children: [
          topWidget(context),
          titleWidget(),
          storeStatusListWidget(),
          // _buildStoreBloc(),
          Container(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              // padding: EdgeInsets.symmetric(vertical: 43.flexibleHeight),
              itemCount: Category.length,
              itemBuilder: (context, index) {
                // print(_storeDataModel!.id);
                // return ListTile(
                //   title: Text("Category "),
                // );
                return InkWell(
                  onTap: () {
                    Get_Product_Category(
                        Category[index]["storeid"], Category[index]["id"]);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(211, 179, 176, 176),
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      height: 80,
                      width: 90,
                      //  color:Colors.red,
                      child: Center(
                          child: Text(
                        Category[index]["title"].toString(),
                        style: TextStyle(
                            color: UIColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))),
                );
              },
            ),
          ),
          _buildStoreBloc()
        ],
      ),
    );
  }

  _buildStoreBloc() {
    return Expanded(
        child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text("ksdhjkshdhsd"),

          // storeItemList(readProductData: state.readProductModel),
          GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),

            // padding: EdgeInsets.symmetric(30.flexibleHeight),
            itemCount: Product_cat.length,
            itemBuilder: (context, index) {
              // print( _storeDataModel!.id);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            // imageUrl: storeItems!.imageUrl!,
                            imageUrl: Product_cat[index]
                                    ["productPicturePath"] ??
                                "https://images.unsplash.com/photo-1591465001609-ded6360ecaab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            height: 120.flexibleHeight,
                            width: 300.flexibleWidth,
                            placeholder: (context, url) => ShimmerEffect(
                              height: 125.flexibleHeight,
                              width: 170.flexibleWidth,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.flexibleWidth,
                            vertical: 6.flexibleHeight),
                        child: Text(
                          Product_cat[index]["description"],
                          style: StyleText.regularLightGray13,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.flexibleWidth),
                                  child: Text(
                                    '\$${Product_cat[index]["price"]} ',
                                    style: StyleText.regularDarkGrey13
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.flexibleWidth),
                                  child: Text(
                                    Product_cat[index]["name"],
                                    style: StyleText.mediumDarkGrey13
                                        .copyWith(fontWeight: FontWeight.w600),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 30.flexibleWidth,
                            height: 41.flexibleHeight,
                            decoration: BoxDecoration(
                              color: UIColors.halfLight,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                            productData: Product_cat[index],
                                          ))),
                              child: Icon(
                                Icons.add,
                                color: UIColors.primaryColor,
                                size: 18.flexibleHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 210.flexibleHeight,
                crossAxisSpacing: 10.flexibleWidth,
                mainAxisSpacing: 5.flexibleHeight),
          )
        ],
      ),
    ));
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
              // Navigator.of(context).pop();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen()));
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
              Icons.favorite_outline,
              color: UIColors.primaryColor,
              size: 20.flexibleHeight,
            ),
            onPressed: () {},
          ),
          4.horizontalSpace,
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

  Widget titleWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.flexibleWidth, vertical: 16.flexibleHeight),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: StoreDetail["storePicturePath"],
              height: 85.flexibleHeight,
              width: 85.flexibleWidth,
              placeholder: (context, url) => ShimmerEffect(
                height: 85.flexibleHeight,
                width: 85.flexibleWidth,
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      UIColors.gradientDarkGray.withOpacity(0.5),
                      UIColors.gradientLightGray,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
            ),
          ),
          20.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StoreDetail["title"],
                  style: StyleText.mediumDarkGrey24,
                ),
                11.verticalSpace,
                Text(
                  '845 Rockville Pike, Rockville, MD , United States. 3.2 miles away.',
                  style: StyleText.regular1LightGray13,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget storeStatusListWidget() {
    return Container(
      height: 2,
      // height: 2.flexibleHeight,
      // margin: EdgeInsets.only(bottom: 2.flexibleHeight),
      child: ListView.builder(
          itemCount: storeStatus.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 20.flexibleWidth),
          itemBuilder: (context, index) {
            // return Padding(
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
            return Container();
          }),
    );
  }

  Widget storeItemList({required List<ReadProductsModel>? readProductData}) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 170.flexibleHeight),
        itemCount: Category.length,
        itemBuilder: (context, index) {
          // print(_storeDataModel!.id);
          // return ListTile(
          //   title: Text("Category "),
          // );
          return InkWell(
            onTap: () {
              Get_Product_Category(
                  Category[index]["storeid"], Category[index]["id"]);
            },
            child: Container(
                decoration: BoxDecoration(
                  color: UIColors.halfLight,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                margin: EdgeInsets.only(left: 5, right: 5),
                height: 50,
                width: 70,
                //  color:Colors.red,
                child: Center(
                    child: Text(
                  Category[index]["title"].toString(),
                  style: TextStyle(color: UIColors.primaryColor),
                ))),
          );
        },
      ),
    );
  }
}
