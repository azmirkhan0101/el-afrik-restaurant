import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/custom_text_field/custom_text_field.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_validator.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import '../../../controllers/auth/new_password_controller.dart';

class NewPasswordScreen extends StatelessWidget {

  final NewPasswordController controller = Get.find<NewPasswordController>();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();

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
                    child: Form(
                      key: newPasswordFormKey,
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
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 12),
                          //===================PASSWORD=======================
                          CustomTextField(
                            fillColor: Colors.transparent,
                            hintText: AppStrings.newPassword.tr,
                            hintStyle: TextStyle(
                                color: AppColors.white,
                            ),
                            inputTextStyle: TextStyle(
                                color: AppColors.white
                            ),
                            controller: controller.passwordController,
                            borderRadius: 10,
                            prefixIcon: Assets.icons.lock,
                            cursorColor: AppColors.white,
                            isBackgroundTransparent: true,
                            isPassword: true,
                            obscureCharacter: '●',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              } else if (!isPasswordValid(password: controller.passwordController.text.trim())) {
                                return "Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character";
                              }
                              return null;
                            }
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.confirmYourNewPassword.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 12),
                          //===================CONFIRM PASSWORD======================
                          CustomTextField(
                            fillColor: Colors.transparent,
                            hintText: AppStrings.confirmPassword.tr,
                            hintStyle: TextStyle(
                              color: AppColors.white
                            ),
                            inputTextStyle: TextStyle(
                              color: AppColors.white
                            ),
                            cursorColor: AppColors.white,
                            controller: controller.confirmPasswordController,
                            borderRadius: 10,
                            prefixIcon: Assets.icons.lock,
                            isBackgroundTransparent: true,
                            isPassword: true,
                            obscureCharacter: '●',
                              validator: (value) {
                            if ( controller.passwordController.text != controller.confirmPasswordController.text ) {
                              return "Passwords not matched";
                            }
                            return null;
                          }
                          ),
                          SizedBox(height: 30.h,),
                          //===================BUTTON=========================
                          Obx((){
                            return LoadingButton(
                                text: AppStrings.confirm.tr,
                                width: double.infinity,
                                isLoading: controller.isPasswordChanging.value,
                                onPressed: (){
                                  if( newPasswordFormKey.currentState!.validate() ){
                                    controller.resetPassword();
                                  }
                                }
                            );
                          }),
                        ],
                      ),
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
