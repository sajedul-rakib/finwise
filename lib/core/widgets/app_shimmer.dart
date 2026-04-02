import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constant/app_colors.dart';

class AppShimmer extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  // Rectangular Shimmer
  const AppShimmer.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  });

  // Circular Shimmer
  const AppShimmer.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // Using your project's color palette
      baseColor: AppColors.fenceGreen.withValues(alpha: 0.2),
      highlightColor: AppColors.fenceGreen.withValues(alpha: 0.05),
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.white, // Dummy color for shimmer to work
          shape: shapeBorder,
        ),
      ),
    );
  }
}
