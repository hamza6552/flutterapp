import 'package:zabardash/core/networking/api_manager.dart';

import 'export_widgets.dart';

class FavoriteStoreWidget extends StatefulWidget {
  HomeCubit? homeCubit;

  FavoriteStoreWidget({
    Key? key,
    this.homeCubit,
  }) : super(key: key);

  @override
  State<FavoriteStoreWidget> createState() => _FavoriteStoreWidgetState();
}

class _FavoriteStoreWidgetState extends State<FavoriteStoreWidget> {
  var List1 = [];
  void initState() {
    super.initState();
    get_fav_store();
  }

  get_fav_store() async {
    try {
      // print()\
      print(
          "*************************************************************************************************");
      final response =
          await ApiManager.instance.request('stores', HttpMethod.GET, null);
      print(response.data);
      // List1= response.data;
      for (var i = 0; i < response.data.length; i++) {
        if (response.data[i]["fevourite_store"] == true) {
          List1.add(response.data[i]);
          print(response.data[i]);
        }
        print(
            "*************************************************************************************************");
      }
      // print(List1[0]);
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
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      builder: (context, state) {
        if (state is Loading) {
          return HomeShimmerWidget(
            isFavorite: true,
          );
        }
        if (state is Loaded) {
          final favoriteData = state.homeDataModel!.favoriteData;
          return Column(
            children: [
              favoriteTitleWidget(),
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
                      print(List1[index]);
                      // return  Text(favoriteData!.length.toString());

                      return CommonStoresWidget(
                        isFavorite: true,
                        favoriteDataModel: favoriteData![0],
                        detail_store: List1[index],
                      );
                    },
                    itemCount: List1.length,
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  Widget favoriteTitleWidget() {
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
            children: [
              Text(
                'Favorites',
                style: StyleText.regularDarkGray14,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.flexibleWidth),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: null,
                    icon: Icon(
                      Icons.favorite,
                      color: UIColors.primaryColor,
                      size: 18.flexibleHeight,
                    )),
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                'See More',
                style: StyleText.regularLightGray13,
              )
            ],
          ),
          SizedBox(
            width: 42.flexibleWidth,
            child: Divider(
              height: 1,
              color: UIColors.primaryColor,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
