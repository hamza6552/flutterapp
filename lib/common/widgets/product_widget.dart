import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zabardash/common/widgets/shimmerEffect.dart';
import 'package:zabardash/core/utils/colors.dart';
import 'package:zabardash/core/utils/sizes.dart';
import 'package:zabardash/core/utils/textStyle.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({this.favoriteIcon = false, Key? key}) : super(key: key);
  final bool? favoriteIcon;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: UIColors.halfLight,
            blurRadius: 12,
            spreadRadius: 12,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildFeaturedWidget(context),
            _buildFeaturedItemPrice(context),
            5.verticalSpace,
            _buildFeaturedItemText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedWidget(BuildContext context) {
    return Container(
      height: 133.flexibleHeight,
      width: 160.flexibleWidth,
      child: CachedNetworkImage(
        imageUrl:
            "https://www.pngall.com/wp-content/uploads/2/Beef-PNG-High-Quality-Image.png",
        fit: BoxFit.cover,
        placeholder: (context, name) {
          return ShimmerEffect(
              height: 133.flexibleHeight, width: 160.flexibleWidth);
        },
        errorWidget: (context, error, child) {
          return ShimmerEffect(
              height: 133.flexibleHeight, width: 160.flexibleWidth);
        },
      ),
    );
  }

  Widget _buildFeaturedItemText(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * .40,
      child: Text(
        'Color Block Striped Draped K...',
        style: StyleText.mediumDarkGrey14,
      ),
    );
  }

  Widget _buildFeaturedItemPrice(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * .40,
      child: Text(
        '\$102.33',
        style: StyleText.regularLightGray13,
      ),
    );
  }
}
