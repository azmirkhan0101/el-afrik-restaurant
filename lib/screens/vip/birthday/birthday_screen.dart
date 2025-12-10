import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/appbar/appbar_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.volcano),
                TextWidget(text: AppStrings.happyBirthday.tr,
                fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                Icon(Icons.volcano),
              ],
            ),
          ),
          Center(
            child: Image.asset(Assets.images.happyBirthday.keyName,
            height: 270.h,
              width: 315.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.w),
            child: TextWidget(text: AppStrings.birthdayGiftJustForYou.tr,
            fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.w),
            child: TextWidget(text: AppStrings.enjoyAFreeDessert.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.w),
            child: TextWidget(text: AppStrings.validFor.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
