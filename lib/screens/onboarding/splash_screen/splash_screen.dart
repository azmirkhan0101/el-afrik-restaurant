import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 531.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: AppColors.greenGradient
                ),
              )
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox( height: 80.h,),
                CustomAssetImage(
                    assetPath: Assets.images.splashOnboarding.keyName,
                    height: 369,
                    width: 246
                ),
                CustomAssetImage(
                    assetPath: Assets.images.logo.keyName,
                    height: 187,
                    width: 332
                ),
                TextWidget(text: AppStrings.quickBites,
                fontSize: 20,
                  fontColor: AppColors.grey72,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox( height: 60.h,),
                TextWidget(text: AppStrings.tasteTheMagic,
                  fontSize: 16,
                  fontColor: AppColors.white,
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
