import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/controllers/auth/otp_verify_controller.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:el_afrik_restaurant/widgets/pin_field_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class OtpVerifyScreen extends StatelessWidget {

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
                        TextWidget(text: "${AppStrings.codeHasBeenSendTo.tr} ${controller.email}",
                        fontSize: 16,
                          fontColor: AppColors.antiFlashWhite,
                        ),
                        SizedBox(height: 30.h,),
                        Center(
                          child: PinFieldWidget(
                              controller: controller.otpController,
                              length: 6
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        SizedBox(
                          height: 40.h,
                          child: Center(
                            child: Obx((){
                              if( controller.isTimerCounting.value ){
                                return RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: AppStrings.resendCodeIn.tr
                                          ),
                                          TextSpan(
                                              text: " ${controller.seconds.value} ",
                                              style: TextStyle(
                                                  color: AppColors.orange
                                              )
                                          ),
                                          TextSpan(
                                              text: "s"
                                          ),
                                        ]
                                    )
                                );
                              }else{
                                return TextButton(
                                    onPressed: (){
                                      controller.resendOtp();
                                    },
                                    child: Text(
                                    "Resend Code",
                                    style: TextStyle(
                                        color: AppColors.orange
                                    )
                                ));
                              }
                            }),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        //===================BUTTON=======================
                        Obx((){
                          return LoadingButton(
                              text: AppStrings.confirm.tr,
                          width: double.infinity,
                          isLoading: controller.isOtpVerifying.value,
                            onPressed: (){
                              if( controller.isSignup ){
                                controller.verifySignupOtp();
                              }else{
                                controller.verifyForgotPasswordOtp();
                              }
                            },
                          );
                        }),
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
