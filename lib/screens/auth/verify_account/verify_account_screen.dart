import 'package:el_afrik_restaurant/controllers/auth/verify_account_controller.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/loading_button/loading_button.dart';

class VerifyAccountScreen extends StatelessWidget {

  final VerifyAccountController controller = Get.find<VerifyAccountController>();

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
              text: "Verify Account",
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
                      TextWidget(text: "An otp will be sent to your email.",
                        fontSize: 16,
                        fontColor: AppColors.antiFlashWhite,
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
                                  TextWidget(
                                    text: AppStrings.viaEmail.tr,
                                    fontColor: AppColors.greyCA,
                                    fontSize: 14,
                                  ),
                                  TextWidget(
                                    text: maskEmail( controller.email() ?? "" ),
                                    //text: "Hey",
                                    fontColor: AppColors.antiFlashWhite,
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
                      //===================BUTTON=========================
                      Obx((){
                        return LoadingButton(
                          width: double.infinity,
                          text: AppStrings.verify.tr,
                          isLoading: controller.isVerificationLoading.value,
                          onPressed: (){
                            controller.sendVerificationOtp();
                          },
                        );
                      }),
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

  //MASK EMAIL TO
  String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    String name = parts[0];
    String domain = parts[1];

    if (name.length <= 3) {
      // If the name is very short, just mask the middle or end
      return "${name[0]}**@$domain";
    }

    // Keep the first 3 and the last 1 character of the name
    String maskedName = name.replaceRange(3, name.length - 1, '*' * (name.length - 4).clamp(3, 10));

    // Note: '.clamp' or a fixed number of asterisks ensures the UI stays consistent
    return "$maskedName@$domain";
  }
}
