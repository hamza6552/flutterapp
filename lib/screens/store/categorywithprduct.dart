// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:zabardash/common/widgets/app_selection_widget.dart';
// import 'package:zabardash/common/widgets/popup_product_categories.dart';
// import 'package:zabardash/common/widgets/shimmerEffect.dart';
// import 'package:zabardash/common/widgets/shimmer_widgets/store_screen_shimmer.dart';
// import 'package:zabardash/common/widgets/store_item_widget.dart';
// import 'package:zabardash/common/widgets/textfield_widget.dart';
// import 'package:zabardash/core/utils/colors.dart';
// import 'package:zabardash/core/utils/showErrorAlert.dart';
// import 'package:zabardash/core/utils/sizes.dart';
// import 'package:zabardash/core/utils/textStyle.dart';
// import 'package:zabardash/dummy_data.dart';
// import 'package:zabardash/models/read_products_model/read_products_model.dart';
// import 'package:zabardash/screens/store/store_bloc/store_cubit.dart';

// import '../../models/home_data_model/home_data_model.dart';

// class CategoryProductScreen extends StatefulWidget {
//   static const routeName = '/store-screen';

//   const CategoryProductScreen({Key? key}) : super(key: key);

//   @override
//   _StoreScreenState createState() => _StoreScreenState();
// }

// class _StoreScreenState extends State<CategoryProductScreen> {
//   int isSelected = 0;
//   StoreCubit? _storeCubit;
//   StoreDataModel? _storeDataModel;

//   @override
//   void initState() {
//     super.initState();
//     _storeCubit = StoreCubit();
//     readProducts();
//   }

//   void readProducts() async {
//     Future.delayed(Duration.zero).then((value) {

                

//       _storeDataModel =
//           ModalRoute.of(context)!.settings.arguments as StoreDataModel;
//           print("c"+_storeDataModel.toString());
//     });
//     await _storeCubit!.readProducts( );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final itemHeight =
//         (size.height - kToolbarHeight - 24 - (size.height * 0.2)) / 2;
//     final itemWidth = size.width / 2;
//     return Scaffold(
//       backgroundColor: UIColors.backgroundColor,
//       body: Column(
//         children: 
//         [topWidget(context), _buildStoreBloc()],
//       ),
//     );
//   }

//   _buildStoreBloc() {
//     return BlocConsumer(
//         bloc: this._storeCubit,
//         builder: (context, state) {
//           if (state is Loading) {
//             return StoreScreenShimmer();
//           }
//           if (state is Loaded) {
//             return Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   titleWidget(),
//                   storeStatusListWidget(),
//                   storeItemList(readProductData: state.readProductModel),
//                 ],
//               ),
//             );
//           }
//           return SizedBox();
//         },
//         listener: (context, state) {
//           if (state is Error) {
//             return ShowErrorAlert.showAdaptiveDialog(context,
//                 message: state.error);
//           }
//         });
//   }

//   Widget topWidget(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//           left: 16.flexibleWidth,
//           top: 40.flexibleHeight,
//           right: 16.flexibleWidth),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             padding: EdgeInsets.zero,
//             constraints: BoxConstraints(),
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: UIColors.darkGray,
//               size: 20.flexibleHeight,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.flexibleWidth),
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 45.flexibleHeight,
//                     width: 275.flexibleWidth,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(6),
//                             topRight: Radius.circular(6),
//                             bottomLeft: Radius.circular(6)),
//                         boxShadow: [
//                           BoxShadow(
//                               color: UIColors.shadowGrey,
//                               blurRadius: 16,
//                               spreadRadius: -10,
//                               offset: Offset(0, 2)
//                               // spreadRadius:1,
//                               ),
//                         ]),
//                   ),
//                   SizedBox(
//                     height: 45.flexibleHeight,
//                     width: 275.flexibleWidth,
//                     child: TextFormFieldWidget(
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter a valid search!';
//                         }
//                         return null;
//                       },
//                       textStyle: StyleText.mediumDarkGreySpacing14,
//                       textInputAction: TextInputAction.next,
//                       hintText: 'Search within store',
//                       hintStyle: StyleText.regularLightGray13,
//                       fillColor: UIColors.white,
//                       trbr: 6,
//                       tlbr: 6,
//                       blbr: 6,
//                       trfbr: 6,
//                       tlfbr: 6,
//                       blfbr: 6,
//                       hcontentPadding: 19.flexibleWidth,
//                       vcontentPadding: 17.flexibleHeight,
//                       prefixIcon: Padding(
//                           padding: EdgeInsets.only(
//                               left: 17.1.flexibleWidth,
//                               right: 16.9.flexibleWidth),
//                           child: Icon(
//                             Icons.search,
//                             color: UIColors.primaryColor,
//                             size: 24.flexibleHeight,
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           IconButton(
//             padding: EdgeInsets.zero,
//             constraints: BoxConstraints(),
//             icon: Icon(
//               Icons.favorite_outline,
//               color: UIColors.primaryColor,
//               size: 20.flexibleHeight,
//             ),
//             onPressed: () {},
//           ),
//           4.horizontalSpace,
//           IconButton(
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
//         ],
//       ),
//     );
//   }

//   Widget titleWidget() {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: 20.flexibleWidth, vertical: 16.flexibleHeight),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: CachedNetworkImage(
//               fit: BoxFit.fill,
//               imageUrl: _storeDataModel?.storePicturePath ??
//                   'https://images.unsplash.com/flagged/photo-1568004614679-c938da0922fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
//               height: 85.flexibleHeight,
//               width: 85.flexibleWidth,
//               placeholder: (context, url) => ShimmerEffect(
//                 height: 85.flexibleHeight,
//                 width: 85.flexibleWidth,
//               ),
//               errorWidget: (context, url, error) => Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       UIColors.gradientDarkGray.withOpacity(0.5),
//                       UIColors.gradientLightGray,
//                     ],
//                     begin: Alignment.bottomLeft,
//                     end: Alignment.topRight,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           20.horizontalSpace,
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _storeDataModel?.title ?? 'Taj Mahal Desi Bazaar',
//                   style: StyleText.mediumDarkGrey24,
//                 ),
//                 11.verticalSpace,
//                 Text(
//                   _storeDataModel?.address ??
//                       '845 Rockville Pike, Rockville, MD , United States. 3.2 miles away.',
//                   style: StyleText.regular1LightGray13,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget storeStatusListWidget() {
//     return Container(
//       height: 40.flexibleHeight,
//       margin: EdgeInsets.only(bottom: 10.flexibleHeight),
//       child: ListView.builder(
//           itemCount: storeStatus.length,
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.only(left: 20.flexibleWidth),
//           itemBuilder: (context, index) {
//             // return Padding(
//             //   padding: EdgeInsets.only(right: 20.flexibleWidth),
//             //   child: SelectionContainer(
//             //     title: storeStatus[index],
//             //     textStyle: isSelected == index
//             //         ? StyleText.regularWhite16
//             //         : StyleText.regularWhite16
//             //             .copyWith(color: UIColors.primaryColor),
//             //     isSelected: isSelected == index ? true : false,
//             //     borderRadius: BorderRadius.only(
//             //         topRight: Radius.circular(8),
//             //         topLeft: Radius.circular(8),
//             //         bottomRight: Radius.circular(8)),
//             //     btnClick: () {
//             //       setState(() {
//             //         isSelected = index;
//             //       });
//             //     },
//             //   ),
//             // );
//                return Container(); 
//           }),
//     );
//   }

//   Widget storeItemList({required List<ReadProductsModel>? readProductData}) {
//     return Expanded(
//       child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
//           child: GridView.builder(
//             shrinkWrap: true,
//             physics: ScrollPhysics(),
//             padding: EdgeInsets.symmetric(vertical: 16.flexibleHeight),
//             itemCount: readProductData!.length,

//             itemBuilder: (context, index) {
//             print( _storeDataModel!.id);
//               return StoreItemWidget(
//                 productData: readProductData[index],
//               );
//             },
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisExtent: 210.flexibleHeight,
//                 crossAxisSpacing: 10.flexibleWidth,
//                 mainAxisSpacing: 10.flexibleHeight),
//           )),
//     );
//   }
// }
