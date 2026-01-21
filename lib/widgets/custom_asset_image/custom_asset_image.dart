import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAssetImage extends StatelessWidget {

  final String assetPath;
  final double height;
  final double width;

  const CustomAssetImage({super.key,
    required this.assetPath, required this.height, required this.width,

  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      height: height.h,
      width: width.w,
      fit: BoxFit.cover,
    );
  }
}
