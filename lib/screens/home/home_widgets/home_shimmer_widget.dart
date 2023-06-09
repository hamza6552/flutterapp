import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/sizes.dart';

import '../../../common/widgets/shimmerEffect.dart';

class HomeShimmerWidget extends StatelessWidget {
  final bool? isFavorite;
  const HomeShimmerWidget({Key? key, this.isFavorite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                  ShimmerEffect(
                    height: 14.flexibleHeight,
                    width: 85.flexibleWidth,
                    isCircular: true,
                  ),
                  isFavorite!
                      ? Padding(
                          padding: EdgeInsets.only(left: 5.flexibleWidth),
                          child: ShimmerEffect(
                            height: 14.flexibleHeight,
                            width: 10.flexibleWidth,
                            isCircular: true,
                          ),
                        )
                      : SizedBox(),
                  Spacer(
                    flex: 2,
                  ),
                  ShimmerEffect(
                    height: 14.flexibleHeight,
                    width: 70.flexibleWidth,
                    isCircular: true,
                  ),
                ],
              ),
              6.verticalSpace,
              ShimmerEffect(
                height: 10.flexibleHeight,
                width: 42.flexibleWidth,
                isCircular: true,
              ),
            ],
          ),
        ),
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
                return Container(
                  margin: EdgeInsets.only(right: 20.flexibleWidth),
                  child: ShimmerEffect(
                    height: 20.flexibleHeight,
                    width: 200.flexibleWidth,
                  ),
                );
              },
              itemCount: 2,
            ),
          ),
        ),
      ],
    );
  }
}
