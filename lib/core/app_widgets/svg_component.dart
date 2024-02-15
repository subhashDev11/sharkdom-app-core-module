import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGComponent extends StatelessWidget {
  const SVGComponent({
    super.key,
    required this.assetName,
    this.fit = BoxFit.contain,
    this.color,
    this.height,
    this.width,
  });

  final String assetName;
  final BoxFit fit;
  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (assetName.contains("assets")) {
      return SvgPicture.asset(
        assetName,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    } else {
      return SvgPicture.network(
        assetName,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
  }
}
