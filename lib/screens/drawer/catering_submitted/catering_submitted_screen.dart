import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class CateringSubmittedScreen extends StatelessWidget {
  const CateringSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(Assets.images.complete.keyName,
          height: 168.h,
            width: 178.w,
          ),
          SizedBox( height: 25.h,),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.w),
            child: TextWidget(text: AppStrings.yourCateringRequest.tr,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontColor: AppColors.greenPrimary,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.w),
            child: TextWidget(text: AppStrings.weWellContactYouSoon.tr,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontColor: AppColors.greenPrimary,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 30.w ),
            child: ButtonWidget(label: AppStrings.okay.tr,
            buttonWidth: double.infinity,
              buttonRadius: 100,
              onPressed: (){

              },
            ),
          ),
          SizedBox( height: 50.h,)
        ],
      ),
    );
  }
}
