import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80.h,),
            Image.asset( Assets.images.logo.keyName,
            height: 153.h,
              width: 272.w,
            ),
            SizedBox(height: 10.h,),
            Image.asset( Assets.images.onboardingGraphics.keyName,
              height: 428.h,
              width: 428.w,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: ButtonWidget(
                label: AppStrings.letsGo,
                backgroundColor: AppColors.greenPrimary,
                buttonWidth: double.infinity,
                buttonRadius: 8,
                textColor: AppColors.white,
                onPressed: (){
                  Get.toNamed( AppRoutes.authSelectionScreen );
                },
              ),
            ),
            SizedBox( height: 70.h,)
          ],
        ),
      ),
    );
  }
}
