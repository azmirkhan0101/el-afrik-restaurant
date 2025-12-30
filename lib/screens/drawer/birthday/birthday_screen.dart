import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/appbar/appbar_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/button_widget/button_widget.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(AppStrings.birthdayReward.tr),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h,),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.images.birthdayCone.keyName,
                height: 22.h,
                  width: 22.w,
                  fit: BoxFit.cover,
                ),
                TextWidget(text: "${AppStrings.happyBirthday.tr}     ",
                fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                Image.asset(Assets.images.birthdayCone.keyName,
                  height: 22.h,
                  width: 22.w,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox( height: 25.h,),
          Center(
            child: Image.asset(Assets.images.happyBirthday.keyName,
            height: 270.h,
              width: 315.w,
            ),
          ),
          SizedBox( height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 30.w),
            child: TextWidget(text: AppStrings.birthdayGiftJustForYou.tr,
            fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 30.w, vertical: 15.h),
            child: TextWidget(text: AppStrings.enjoyAFreeDessert.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 30.w),
            child: TextWidget(text: "${AppStrings.validFor.tr} 7 ${AppStrings.days.tr}",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 31.w ),
            child: ButtonWidget(label: AppStrings.claimReward.tr,
              buttonRadius: 100,
              onPressed: (){

              },
            ),
          ),
          SizedBox(height: 50.h,)
        ],
      ),
    );
  }
}
