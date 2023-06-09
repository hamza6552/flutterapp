import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/common/widgets/store_widget2.dart';
import 'package:zabardash/common/widgets/stores_widget.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';
import 'package:zabardash/screens/store/store_screen.dart';
import 'package:zabardash/screens/store/storescreen2.dart';

import '../../core/networking/api_controller.dart';
import '../../models/home_data_model/home_data_model.dart';
import '../home/home_bloc/home_cubit.dart';
import '../home/home_widgets/export_widgets.dart';

class FeatureProductScreen extends StatefulWidget {
  // static const routeName = '/feature-product-screen';
  // var ProductList;
  var newproductList;
  FeatureProductScreen(this.newproductList);

  // const FeatureProductScreen({Key? key}) : super(key: key);

  @override
  State<FeatureProductScreen> createState() =>
      _FeatureProductScreenState(newproductList);
}

class _FeatureProductScreenState extends State<FeatureProductScreen> {
//  final arguments = settings.argume.nts;

  _FeatureProductScreenState(productList);
  var get_store_details1 = [];
  //  List<StoreDataModel> readStoresData=[];

  HomeCubit? _homeCubit;
  @override
  void initState() {
    super.initState();
    print("gsdgsgd" + widget.newproductList["store_id"].toString());
    print("store id" + widget.newproductList["store_id"].toString());
    getstore_detail();
    _homeCubit = HomeCubit()..homeData();
  }

  getstore_detail() async {
    final response = await ApiController.instance
        .get_Store_Detail_Id(widget.newproductList["store_id"]);
    print(response.toString());
    print("***********");

    get_store_details1.add(response);

    setState(() {});
  }
  // void initState() {
  //   super.initState();
  //   print(widget.ProductList["productPicturePath"]);
  //   // print(StoreDataModel.toString()+"dara");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topWidget(context),
            productImageWidget(),
            // instaTitleWidget(),
            // instaListWidget(),
            availableStoreTitleWidget(),
            SizedBox(
              height: 30,
            ),
            BlocConsumer<HomeCubit, HomeState>(
              bloc: _homeCubit,
              listener: (context, state) {
                if (state is Error) {
                  return ShowErrorAlert.showAdaptiveDialog(context,
                      message: state.error);
                }
              },
              builder: (context, state) {
                if (state is Loading) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 16.flexibleWidth,
                        right: 28.flexibleWidth,
                        top: 24.flexibleHeight),
                    child: ShimmerEffect(
                      height: 139.flexibleHeight,
                      width: 382.flexibleWidth,
                    ),
                  );
                }
                if (state is Loaded) {
                  // print("data" + widget.ProductList.toString());

                  return Column(
                    children: [
                      // storeTitleWidget(),
                      GestureDetector(
                        onTap: () async {
                          print(get_store_details1[0]);
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setInt("Store_Id", get_store_details1[0]["id"]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StoreScreen2(get_store_details1[0])));
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "${get_store_details1[0]["storePicturePath"]}",
                                height: 139.flexibleHeight,
                                width: 382.flexibleWidth,
                                placeholder: (context, url) => ShimmerEffect(
                                  height: 139.flexibleHeight,
                                  width: 382.flexibleWidth,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.flexibleWidth,
                                  right: 8.flexibleWidth,
                                  bottom: 25.flexibleHeight,
                                  top: 8.flexibleHeight),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        get_store_details1[0]["title"],
                                        style: StyleText.boldDarkGray14,
                                      ),
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Text(
                                        '${get_store_details1[0]["rating"]}',
                                        style: StyleText.regularDarkGray13,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: UIColors.yellow,
                                        size: 18.flexibleHeight,
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   "${widget.readStoresData![index].address}",
                                  //   style: StyleText.regular1LightGray13,
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                      // StoresWidget2(
                      //   id: widget.ProductList["store_id"],
                      //   readStoresData: state.homeDataModel!.storeData,
                      // ),
                    ],
                  );
                }
                ;
                return SizedBox();
              },
            ),
          ],
        ),
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

  Widget productImageWidget() {
    return Container(
      margin: EdgeInsets.only(
          top: 24.flexibleHeight,
          left: 16.flexibleWidth,
          right: 16.flexibleWidth),
      height: 90.flexibleHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.newproductList["productPicturePath"],
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          UIColors.darkerGray.withOpacity(0.55),
                          BlendMode.srcOver)),
                ),
              ),
              height: 90.flexibleHeight,
              width: 382.flexibleWidth,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
                height: 90.flexibleHeight,
                width: 382.flexibleWidth,
                padding: EdgeInsets.symmetric(horizontal: 14.flexibleWidth),
                child: Center(
                  child: Text(
                    widget.newproductList["name"],
                    style: StyleText.boldWhite14,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget instaTitleWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.flexibleWidth,
          right: 35.flexibleWidth,
          top: 17.flexibleHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Instagram',
                style: StyleText.regularDarkGray14,
              ),
              Text(
                'Visit Profile',
                style: StyleText.regularLightGray13,
              )
            ],
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

  Widget instaListWidget() {
    return Container(
      margin: EdgeInsets.only(top: 17.flexibleHeight),
      height: 72.flexibleHeight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.flexibleWidth),
        itemBuilder: (context, index) {
          return Container(
            width: 83.flexibleWidth,
            margin: EdgeInsets.only(right: 16.flexibleWidth),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: '',
                height: 82.flexibleHeight,
                width: 152.flexibleWidth,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
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
          );
        },
        itemCount: 6,
      ),
    );
  }

  Widget availableStoreTitleWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.flexibleWidth,
          right: 35.flexibleWidth,
          top: 25.flexibleHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Available in these stores',
                style: StyleText.regularDarkGray14,
              ),
            ],
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
}
