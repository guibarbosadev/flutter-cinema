import 'package:flutter/widgets.dart';
import 'dart:math';

class RoundedImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  RoundedImage({
    @required this.width,
    @required this.height,
    @required this.imageUrl,
  });

  double defineRadiusValue(double width, double height) {
    return min(width, height) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(defineRadiusValue(width, height)),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
      ),
    );
  }
}
