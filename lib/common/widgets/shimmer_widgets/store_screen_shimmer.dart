import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/sizes.dart';

import '../shimmerEffect.dart';

class StoreScreenShimmer extends StatelessWidget {
  const StoreScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.flexibleWidth, vertical: 16.flexibleHeight),
            child: Row(
              children: [
                ShimmerEffect(
                  height: 85.flexibleHeight,
                  width: 85.flexibleWidth,
                ),
                20.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerEffect(
                        height: 20.flexibleHeight,
                        width: double.infinity,
                      ),
                      11.verticalSpace,
                      ShimmerEffect(
                        height: 20.flexibleHeight,
                        width: double.infinity,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40.flexibleHeight,
            margin: EdgeInsets.only(bottom: 10.flexibleHeight),
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20.flexibleWidth),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.flexibleWidth),
                    child: ShimmerEffect(),
                  );
                }),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.flexibleWidth),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16.flexibleHeight),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ShimmerEffect(
                      height: 100,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200.flexibleHeight,
                      crossAxisSpacing: 10.flexibleWidth,
                      mainAxisSpacing: 10.flexibleHeight),
                )),
          ),
        ],
      ),
    );
  }
}
