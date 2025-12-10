import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/custom_text_field/custom_text_field.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import 'controller/new_password_controller.dart';

class NewPasswordScreen extends StatelessWidget {

  final NewPasswordController controller = Get.find<NewPasswordController>();

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
            text: AppStrings.createNewPassword.tr,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    children: [
                      Image.asset(
                          Assets.images.createPasswordGraphics.keyName,
                        height: 315.h,
                        width: 315.w,
                      ),
                      SizedBox(height: 20),
                      //===================EMAIL=========================//
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: AppStrings.enterYourNewPassword.tr,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.aniFlashWhite,
                          figmaLetterSpacing: -2,
                        ),
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        hintText: AppStrings.newPassword.tr,
                        controller: controller.passwordController,
                        borderRadius: 10,
                        prefixIcon: Assets.icons.lock,
                        isPassword: true,
                      ),
                      SizedBox(height: 20),
                      //===================PASSWORD=========================//
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: AppStrings.confirmYourNewPassword.tr,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.aniFlashWhite,
                          figmaLetterSpacing: -2,
                        ),
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        hintText: AppStrings.confirmPassword.tr,
                        controller: controller.confirmPasswordController,
                        borderRadius: 10,
                        prefixIcon: Assets.icons.lock,
                        isPassword: true,
                      ),
                      SizedBox(height: 30.h,),
                      //===================BUTTON=========================//
                      ButtonWidget(label: AppStrings.confirm.tr,
                        fontWeight: FontWeight.w700,
                        backgroundColor: AppColors.greenPrimary,
                        buttonWidth: double.infinity,
                        buttonHeight: 60.h,
                      ),
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
