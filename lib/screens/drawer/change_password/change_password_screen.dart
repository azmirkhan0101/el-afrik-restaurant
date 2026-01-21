import 'package:el_afrik_restaurant/controllers/drawer/settings_controller.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/custom_text_field/custom_text_field.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_validator.dart';

class ChangePasswordScreen extends StatelessWidget {

  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(
          text: AppStrings.changePassword.tr,
        fontSize: 20,
          fontWeight: FontWeight.w700,
          fontColor: AppColors.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: controller.changePasswordFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                TextWidget(text: AppStrings.currentPassword.tr),
                SizedBox( height: 10.h,),
                //========================CURRENT PASSWORD==============================
                CustomTextField(
                    hintText: AppStrings.currentPassword.tr,
                    controller: controller.currentPassword,
                  isPassword: true,
                  validator: (value){
                      if( value == null || value.isEmpty ){
                      return "Current password is required";
                    }
                      if( !isPasswordValid(password: controller.currentPassword.text.trim()) ){
                        return "Current password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character";
                      }
                    return null;
                  },
                ),
                SizedBox( height: 15.h,),
                TextWidget(text: AppStrings.newPassword.tr),
                SizedBox( height: 10.h,),
                //======================NEW PASSWORD============================
                CustomTextField(
                  hintText: AppStrings.newPassword.tr,
                  controller: controller.newPassword,
                  isPassword: true, validator: (value){
                  if( value == null || value.isEmpty ){
                    return "New password is required";
                  }
                  if( !isPasswordValid(password: controller.currentPassword.text.trim()) ){
                    return "New password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character";
                  }
                  return null;
                },
                ),
                SizedBox( height: 15.h,),
                TextWidget(text: AppStrings.confirmPassword.tr),
                SizedBox( height: 10.h,),
                //========================CONFIRM PASSWORD=======================
                CustomTextField(
                  hintText: AppStrings.confirmPassword.tr,
                  controller: controller.confirmPassword,
                  isPassword: true,
                  validator: (value){
                  if( controller.newPassword.text != controller.confirmPassword.text ){
                    return "Passwords not matched";
                  }
                  return null;
                },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only( left: 15.w, right: 15.w, bottom: 40.h ),
        child: Obx((){
          return LoadingButton(text: AppStrings.confirm.tr,
          width: double.infinity,
            isLoading: controller.isChangePasswordLoading.value,
            onPressed: (){
              if( controller.changePasswordFormKey.currentState!.validate() ){
                controller.changePassword();
              }
            }
          );
        })
      ),
    );
  }
}
