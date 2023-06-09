import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/screens/store/storescreen2.dart';

import '../../../core/networking/api_manager.dart';
import '../../../models/Faourite_Store.dart';
import 'export_widgets.dart';

class FeaturedStoreWidget extends StatefulWidget {
  // final HomeCubit? homeCubit;

  const FeaturedStoreWidget({Key? key}) : super(key: key);

  @override
  State<FeaturedStoreWidget> createState() => _FeaturedStoreWidgetState();
}

class _FeaturedStoreWidgetState extends State<FeaturedStoreWidget> {
  void initState() {
    super.initState();
    getadta();
  }

  var List1 = [];

  getadta() async {
    try {
      // print()
      final response =
          await ApiManager.instance.request('stores', HttpMethod.GET, null);
      print(response.data);
      // List1= response.data;
      for (var i = 0; i < response.data.length; i++) {
        print(response.data[i]);
        if (response.data[i]["is_featured"] == true) {
          List1.add(response.data[i]);
        }
      }
      print(List1[0]);
      setState(() {});

      //
      // final homeData = FavouriteStore.fromJson(response.data);
      // print('response.data ');
      // return homeData;
    } catch (e) {
      // throw e;
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        featuredStoreTitleWidget(),
        Container(
          height: 158.flexibleHeight,
          child: Container(
              margin: EdgeInsets.only(top: 9.flexibleHeight),
              height: 135.flexibleHeight,
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16.flexibleWidth),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  print(List1[index]["title"] + "xnbjbs");
                  // print("far"+state.homeDataModel!.featuredStoresData![index]["storePicturePath"].toString());
                  // return Image.network()
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16.flexibleWidth),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: List1[index]["storePicturePath"],
                            // : "${state.readStoresModel![index].storePicturePath}",
                            height: 135.flexibleHeight,
                            width: 228.flexibleWidth,
                            placeholder: (context, url) => ShimmerEffect(
                              width: 228.flexibleWidth,
                              height: 135.flexibleHeight,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20.flexibleWidth,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: UIColors.primaryColor,
                            size: 18.flexibleHeight,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 34.flexibleWidth,
                        bottom: 0,
                        child: Container(
                          height: 32.flexibleHeight,
                          width: 189.flexibleWidth,
                          margin: EdgeInsets.only(left: 16.flexibleWidth),
                          child: ButtonWidget(
                              btnClick: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setInt("Store_Id", List1[index]["id"]);

                                // Navigator.of(context).pushNamed(StoreScreen.routeName,
                                //     arguments:List1[index]);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StoreScreen2(List1[index]))
                                            );
                              },
                              btnText: List1[index]["title"],
                              brbottomRight: 6,
                              brtopLeft: 6,
                              textStyle: StyleText.regularDarkGrey13.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2)),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: List1.length,
              )),
        ),
      ],
    );
  }

  Widget featuredStoreTitleWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.flexibleWidth,
          right: 28.flexibleWidth,
          top: 10.flexibleHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Stores',
                style: StyleText.regularDarkGray14,
              ),
              Text(
                'Show all',
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
}
