import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double height;
  final double width;
  final bool isCircular;

  const ShimmerEffect({
    Key? key,
    this.height = 30.0,
    this.width = 100.0,
    this.isCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: this.width,
        height: this.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(this.isCircular ? this.height : 8)),
      ),
    );
  }
}
