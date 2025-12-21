import 'package:el_afrik_restaurant/screens/drawer/change_password/controller/change_password_controller.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/custom_text_field/custom_text_field.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {

  final ChangePasswordController controller = Get.find<ChangePasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(text: AppStrings.changePassword.tr,
        fontSize: 20,
          fontWeight: FontWeight.w700,
          fontColor: AppColors.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              TextWidget(text: AppStrings.currentPassword.tr),
              SizedBox( height: 10.h,),
              CustomTextField(
                  hintText: AppStrings.currentPassword.tr,
                  controller: controller.currentPassword,
                isPassword: true,
              ),
              SizedBox( height: 15.h,),
              TextWidget(text: AppStrings.newPassword.tr),
              SizedBox( height: 10.h,),
              CustomTextField(
                hintText: AppStrings.newPassword.tr,
                controller: controller.newPassword,
                isPassword: true,
              ),
              SizedBox( height: 15.h,),
              TextWidget(text: AppStrings.confirmPassword.tr),
              SizedBox( height: 10.h,),
              CustomTextField(
                hintText: AppStrings.confirmPassword.tr,
                controller: controller.confirmPassword,
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only( left: 15.w, right: 15.w, bottom: 40.h ),
        child: ButtonWidget(label: AppStrings.confirm.tr,
          backgroundColor: AppColors.greenPrimary,
          buttonWidth: double.infinity,
          buttonRadius: 100,
          onPressed: (){

          },
        ),
      ),
    );
  }
}
