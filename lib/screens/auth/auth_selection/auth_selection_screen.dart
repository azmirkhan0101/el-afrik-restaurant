import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/button_widget/button_widget.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.logo.keyName,
              height: 146.h,
              width: 260.w,
            ),
            SizedBox(height: 10.h,),
            TextWidget(text: AppStrings.letsGetStarted,
            fontWeight: FontWeight.w700,
            fontSize: 20,
              fontColor: AppColors.blackTitle,
            ),
            SizedBox(height: 10.h,),
            TextWidget(text: AppStrings.loginToSatisfy,
              fontWeight: FontWeight.w500,
              fontColor: AppColors.blackSubtitle,
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: ButtonWidget(label: AppStrings.logIn,
                buttonWidth: double.infinity,
                onPressed:(){
                Get.toNamed( AppRoutes.loginScreen);
                },
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: ButtonWidget(label: AppStrings.signUp,
                buttonWidth: double.infinity,
                backgroundColor: Colors.transparent,
                borderWidth: 2.r,
                borderColor: AppColors.orange,
                textColor: AppColors.orange,
                onPressed:(){
                  Get.toNamed( AppRoutes.signupScreen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
