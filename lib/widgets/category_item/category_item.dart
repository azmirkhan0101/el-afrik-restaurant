import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/app_colors/app_colors.dart';
import '../text_widget/text_widgets.dart';

class CategoryItem extends StatelessWidget {

  final String imagePath;
  final String categoryName;
  final double height;
  final double width;
  final double imageWidth;
  final double imageHeight;
  final double marginRight;
  final VoidCallback? onClick;

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.categoryName,
    this.height = 110,
    this.width = 80,
    this.imageHeight = 65,
    this.imageWidth = 65,
    this.marginRight = 6,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onClick,
      child: Container(
        width: width.w,
        margin: EdgeInsets.only(right: marginRight.w, left: marginRight.w),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.categoryGreen,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 65.h,
              width: 65.w,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.no_food_rounded,
                      size: 70.r,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            TextWidget(
              text: categoryName,
              fontSize: 15,
              fontColor: AppColors.black,
              maxLines: 1,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
