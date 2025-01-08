import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_explorer/helpers/corner_radius/corner_radius.dart';
import 'package:shimmer/shimmer.dart';

import '../../managers/theme/colors_manager.dart';

class ShimmerHelper {
  static final Color _shimmerBase = ColorsManager.foundationMainBlack;
  static final Color _shimmerHighlighted = Colors.grey.shade900;

  buildBasicShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      baseColor: _shimmerBase,
      highlightColor: _shimmerHighlighted,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: ColorsManager.foundationMainBlack,
            borderRadius: BorderRadius.circular(CornerRadius.sixteen)),
      ),
    );
  }

  buildGridShimmer() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
      ),
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: _shimmerBase,
          highlightColor: _shimmerHighlighted,
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.foundationMainBlack,
              borderRadius: BorderRadius.circular(CornerRadius.sixteen),
            ),
          ),
        );
      },
    );
  }

  buildImagesLoadingShimmer({height, width, paddingHorizontal}) {
    return SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 0),
          child: Shimmer.fromColors(
            baseColor: _shimmerBase,
            highlightColor: _shimmerHighlighted,
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x102c3e50),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
