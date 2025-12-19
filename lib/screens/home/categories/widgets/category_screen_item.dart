import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/assets_gen/assets.gen.dart';
import '../../../../widgets/text_widget/text_widgets.dart';

class CategoryScreenItem extends StatelessWidget {

  final String imagePath;
  final String itemName;
  final double height;
  final double width;
  final double imageWidth;
  final double imageHeight;

  const CategoryScreenItem({
    super.key,
    required this.imagePath,
    required this.itemName,
    this.height = 110,
    this.width = 80,
    this.imageHeight = 65,
    this.imageWidth = 65,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8.h,
        children: [
          CircleAvatar(
            radius: 34.r,
            backgroundImage: AssetImage(Assets.dummy.pizza.keyName,
            )
          ),
          Expanded(
            child: TextWidget(text: itemName,
              fontSize: 18.sp,
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
