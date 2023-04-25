import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInImageWidget extends StatelessWidget {
  const FadeInImageWidget(
      {this.fit,
      this.radius = 10,
      this.height,
      required this.photo,
      super.key});
  final String photo;
  final double? height;
  final BoxFit? fit;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: photo,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
