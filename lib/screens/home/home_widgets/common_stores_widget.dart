import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/screens/store/storescreen2.dart';

import 'export_widgets.dart';

class CommonStoresWidget extends StatefulWidget {
  ReadStoresModel? readStoresModel;
  FavoriteDataModel? favoriteDataModel;
  bool? isFavorite;
  var detail_store;
  CommonStoresWidget({
    Key? key,
    this.readStoresModel,
    this.favoriteDataModel,
    required this.isFavorite,
    this.detail_store,
  }) : super(key: key);

  @override
  State<CommonStoresWidget> createState() => _CommonStoresWidgetState();
}

class _CommonStoresWidgetState extends State<CommonStoresWidget> {
  void initState() {
    super.initState();
    print(
        "&&&&&&&&&&&*****************&&&&&&&&&&&&&&&&&&****************&&&&&&&&&&&&&&&&&&&&&&");
    print(widget.detail_store);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 16.flexibleWidth),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.detail_store["storePicturePath"],
              height: 135.flexibleHeight,
              width: 228.flexibleWidth,
              placeholder: (context, url) => ShimmerEffect(
                width: 228.flexibleWidth,
                height: 135.flexibleHeight,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
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
              !widget.isFavorite! ? Icons.favorite_outline : Icons.favorite,
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
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setInt("Store_Id", widget.detail_store["id"]);

                  // Navigator.of(context).pushNamed(StoreScreen.routeName,
                  //     arguments:List1[index]);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StoreScreen2(widget.detail_store)));
                },

                // //
                //       // Navigator.of(context).pushNamed(StoreScreen.routeName,arguments: {
                //         // widget.readStoresModel,
                //       }),
                btnText: widget.detail_store["title"],
                brbottomRight: 6,
                brtopLeft: 6,
                textStyle: StyleText.regularDarkGrey13
                    .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          ),
        ),
      ],
    );
  }
}
