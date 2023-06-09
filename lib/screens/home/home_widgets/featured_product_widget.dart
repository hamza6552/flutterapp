import '../../../core/networking/api_controller.dart';
import 'export_widgets.dart';

class FeaturedProductWidget extends StatefulWidget {
  final HomeCubit? homeCubit;

  const FeaturedProductWidget({Key? key, this.homeCubit}) : super(key: key);

  @override
  State<FeaturedProductWidget> createState() => _FeaturedProductWidgetState();
}

class _FeaturedProductWidgetState extends State<FeaturedProductWidget> {
  var get_featured_product_list = [];

  @override
  void initState() {
    super.initState();
    getallfeaturedProduct();
  }

  getallfeaturedProduct() async {
    final response = await ApiController.instance.getAllproduct();
    print("sjnjsnjdnjnsd" + response.toString() + "shdjhsjdhs");
    for (var i = 0; i < response.length; i++) {
      if (response[i]["is_featured"] == true) {
        print("call 123");
        print(response[i]);
        print("hjshjh");
        get_featured_product_list.add(response[i]);
      }
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      builder: (context, state) {
        if (state is Loading) {
          return HomeShimmerWidget();
        }
        if (state is Loaded) {
          // print(state.homeDataModel!.featuredProductsData!.length.toString());
          return Column(
            children: [
              _featuredProductsTitleWidget(),
              _featuredProductListWidget(
                  state.homeDataModel!.featuredProductsData,
                  get_featured_product_list)
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  Widget _featuredProductsTitleWidget() {
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
                'Products',
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

  Widget _featuredProductListWidget(
      List<dynamic>? featuredProductsData, get_list) {
    // print("data"+featuredProductsData!.length.toString());
    return Container(
      margin: EdgeInsets.only(
        top: 6.flexibleHeight,
      ),
      height: 100.flexibleHeight,
      child: get_list.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.only(left: 16.flexibleWidth),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // print("product"+featuredProductsData[index].toString());
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 16.flexibleWidth, bottom: 5.flexibleHeight),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FeatureProductScreen(
                                  get_list[index])));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: get_list[index]["productPicturePath"],
                            height: 70.flexibleHeight,
                            width: 152.flexibleWidth,
                            placeholder: (context, url) => ShimmerEffect(
                              height: 70.flexibleHeight,
                              width: 152.flexibleWidth,
                            ),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    UIColors.gradientDarkGray.withOpacity(0.4),
                                    UIColors.gradientLightGray,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 16.flexibleWidth),
                        width: 152.flexibleWidth,
                        // height: 30.flexibleHeight,
                        child: Text(
                          get_list[index]["name"],
                          style: StyleText.regularLightGray13,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))
                  ],
                );
              },
              itemCount: get_list.length,
            )
          : NotAvailableHomeWidget(
              text: 'Featured Products Not Available Right Now'),
    );
  }
}
