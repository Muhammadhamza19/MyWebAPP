import 'package:flutter/material.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:shimmer/shimmer.dart';

/// This is merely a wrapper class to allow the use of the Shimmer package
/// when we're in a loading state and to ignore it if not.
class ShimmerWidget extends StatelessWidget {
  final Widget child;

  const ShimmerWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: secondaryColor[50]!,
      highlightColor: backgroundColor,
      child: child,
    );
  }
}
