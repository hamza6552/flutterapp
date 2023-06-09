import 'package:zabardash/screens/home/home_widgets/FEATURELISTPRODUCT.dart';

import 'export_widgets.dart';

class FeaturedPageWidget extends StatelessWidget {
  final HomeCubit? homeCubit;

  const FeaturedPageWidget({Key? key, this.homeCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (context, state) {
        if (state is Loading) {
          return HomeShimmerWidget();
        }
        if (state is Loaded) {
          return Column(
            children: [
              _featuredPageTitleWidget(),
              _featuredPageListWidget(
                  featuredPagesDataModel:
                      state.homeDataModel!.featuredPagesData)
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  Widget _featuredPageTitleWidget() {
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
                'Featured Pages',
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

  Widget _featuredPageListWidget(
      {required List<FeaturedPagesDataModel>? featuredPagesDataModel}) {
    return Container(
      margin: EdgeInsets.only(top: 6.flexibleHeight),
      height: 135.flexibleHeight,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16.flexibleWidth),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final featuredPageData = featuredPagesDataModel![index];
          print("data pic" + featuredPageData.pagePicturePath.toString());
          return GestureDetector(
            onTap: () {
              print(featuredPagesDataModel[index].toJson());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeatureProductList(
                          featuredPagesDataModel[index].toJson())));
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16.flexibleWidth),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "${featuredPageData.pagePicturePath}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  UIColors.darkerGray.withOpacity(0.22),
                                  BlendMode.srcOver)),
                        ),
                      ),
                      height: 135.flexibleHeight,
                      width: 228.flexibleWidth,
                      placeholder: (context, url) => ShimmerEffect(
                          width: 228.flexibleWidth, height: 135.flexibleHeight),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                // Positioned(
                //   left: 0,
                //   right: 16.flexibleWidth,
                //   child: Container(
                //       height: 135.flexibleHeight,
                //       width: 200.flexibleWidth,
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 14.flexibleWidth),
                //       child: Center(
                //         child: Text(
                //           '${featuredPageData.title}',
                //           style: StyleText.boldWhite14,
                //           textAlign: TextAlign.center,
                //         ),
                //       )),
                // ),
              ],
            ),
          );
        },
        itemCount: featuredPagesDataModel!.length,
      ),
    );
  }
}
