import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors/app_colors.dart';
import '../text_widget/text_widgets.dart';

class CategoryItem extends StatelessWidget {

  final String imagePath;
  final String itemName;
  final double height;
  final double width;
  final double imageWidth;
  final double imageHeight;
  final double marginRight;

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.itemName,
    this.height = 100,
    this.width = 80,
    this.imageHeight = 62,
    this.imageWidth = 65,
    this.marginRight = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      margin: EdgeInsets.only(right: marginRight.w),
      decoration: BoxDecoration(
          color: AppColors.greenShade,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              imagePath,
              width:imageWidth.w,
              height: imageHeight.h,
          ),
          Expanded(
            child: TextWidget(text: itemName,
              fontSize: 16.sp,
              fontColor: AppColors.black,
              maxLines: 1,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
