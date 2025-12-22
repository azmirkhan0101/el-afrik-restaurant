import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/auth/otp_verify/controller/otp_verify_controller.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/pin_field_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class OtpVerifyScreen extends StatelessWidget {

  String email = Get.arguments ?? "abc@mail.com";
  final OtpVerifyController controller = Get.find<OtpVerifyController>();

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
            text: AppStrings.verifyEmail.tr,
            fontColor: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          leading: Icon(Icons.arrow_back_sharp, color: AppColors.white),
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            Assets.images.otpGraphics.keyName,
                          height: 270.h,
                          width: 274.w,
                        ),
                        SizedBox(height: 20.h,),
                        TextWidget(text: "${AppStrings.codeHasBeenSendTo.tr} abc@mail.com",
                        fontSize: 16,
                          fontColor: AppColors.aniFlashWhite,
                        ),
                        SizedBox(height: 30.h,),
                        Padding(
                          padding: EdgeInsets.symmetric( horizontal: 40.w ),
                          child: PinFieldWidget(
                              controller: controller.otpController,
                              length: 4
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        RichText(text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.resendCodeIn.tr
                            ),
                            TextSpan(
                                text: " 53 s",
                              style: TextStyle(
                                color: AppColors.orange
                              )
                            ),
                          ]
                        )
                        ),
                        SizedBox(height: 20.h,),
                        //===================BUTTON=========================//
                        ButtonWidget(label: AppStrings.confirm.tr,
                          fontWeight: FontWeight.w700,
                          backgroundColor: AppColors.greenPrimary,
                          buttonWidth: double.infinity,
                          buttonHeight: 60.h,
                          onPressed: (){
                          Get.toNamed(AppRoutes.newPasswordScreen);
                          },
                        ),
                        SizedBox(height: 10.h,),
                      ],
                    ),
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
