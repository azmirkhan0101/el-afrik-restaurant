import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {

  String email = Get.arguments ?? "abc@mail.com";
  final ForgotPasswordController controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, // status bar text color
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
          centerTitle: true,
          title: TextWidget(
            text: AppStrings.forgotPassword.tr,
            fontColor: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_sharp, color: AppColors.white),)
        ),
        body: Stack(
          children: [
            //FULL SCREEN BACKGROUND
            Positioned.fill(
              child: Image.asset(
                Assets.images.loginBackground.keyName,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          Assets.images.forgotPasswordGraphics.keyName,
                        height: 278.h,
                        width: 372.w,
                      ),
                      SizedBox(height: 20.h,),
                      TextWidget(text: AppStrings.selectTheContactMethod.tr,
                      fontSize: 16,
                        fontColor: AppColors.aniFlashWhite,
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.greyB8,
                            width: 1.r
                          )
                        ),
                        child: Row(
                          spacing: 20.w,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.r),
                              decoration: BoxDecoration(
                                color: AppColors.greenShade,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child: Icon(Icons.email_rounded, color: AppColors.greenPrimary,),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: AppStrings.viaEmail.tr,
                                  fontColor: AppColors.greyCA,
                                    fontSize: 14,
                                  ),
                                  TextWidget(text: "dummy***@mail.com",
                                    fontColor: AppColors.aniFlashWhite,
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      //===================BUTTON=========================//
                      ButtonWidget(
                        label: AppStrings.verify.tr,
                        fontWeight: FontWeight.w700,
                        backgroundColor: AppColors.greenPrimary,
                        buttonWidth: double.infinity,
                        buttonHeight: 60.h,
                        onPressed: (){
                        Get.toNamed(AppRoutes.otpVerifyScreen);
                        },
                      ),
                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
