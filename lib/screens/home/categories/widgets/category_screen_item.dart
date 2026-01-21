import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../widgets/text_widget/text_widgets.dart';

class CategoryScreenItem extends StatelessWidget {

  final String imagePath;
  final String categoryName;
  final double height;
  final double width;
  final double imageWidth;
  final double imageHeight;
  final VoidCallback? onClick;

  const CategoryScreenItem({
    super.key,
    required this.imagePath,
    required this.categoryName,
    this.height = 110,
    this.width = 80,
    this.imageHeight = 65,
    this.imageWidth = 65,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height.h,
        width: width.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.h,
          children: [
            SizedBox(
              height: 80.h,
              width: 80.w,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
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
            Expanded(
              child: TextWidget(
                text: categoryName,
                fontSize: 18.sp,
                fontColor: AppColors.black,
                maxLines: 1,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
