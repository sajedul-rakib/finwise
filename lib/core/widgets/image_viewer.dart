import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
    this.color,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      alignment: Alignment.center,
      repeat: ImageRepeat.noRepeat,
      color: color,
    );
  }
}
