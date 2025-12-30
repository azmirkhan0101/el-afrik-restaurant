import 'package:el_afrik_restaurant/controllers/auth/sign_up_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:el_afrik_restaurant/widgets/profile_avatar/profile_avatar.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/custom_text_field/custom_text_field.dart';
import '../login/components/bordered_icon_button.dart';

class SignupScreen extends StatelessWidget {

  final SignUpController controller = Get.find<SignUpController>();

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
            text: AppStrings.signUp.tr,
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.singupFormKey,
                      child: Column(
                        children: [
                          SizedBox(height: 12.h,),
                          //===================USER PHOTO=========================//
                          Align(
                            alignment: Alignment.topCenter,
                            child: ProfileAvatar(
                                onClick: (file){
                                  controller.profileImage.value = file;
                                }
                            )
                          ),
                          SizedBox(height: 8),
                          //===================FULL NAME=========================//
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.fullName.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.aniFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          //NAMEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            spacing: 15.w,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hintText: AppStrings.firstName.tr,
                                  controller: controller.firstNameController,
                                  borderRadius: 10,
                                  isPassword: false,
                                  validator: (value){
                                    if( value == null || value.isEmpty ){
                                      return "First name is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: CustomTextField(
                                  hintText: AppStrings.lastName.tr,
                                  controller: controller.lastNameController,
                                  borderRadius: 10,
                                  isPassword: false,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          //EMAILLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.emailAddress.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.aniFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            hintText: AppStrings.enterEmail.tr,
                            controller: controller.emailController,
                            borderRadius: 10,
                            prefixIcon: Assets.icons.email,
                          ),
                          SizedBox(height: 8),
                          //========================DATE OF BIRTH===============================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.dateOfBirth.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.aniFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomDatePicker(onDateSelected: (date){
                            controller.dateOfBirth = date;
                          }),
                          SizedBox(height: 8),
                          //======================LOCATION======================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.location.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.aniFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            hintText: "Location",
                            controller: controller.locationController,
                            borderRadius: 10,
                            prefixIcon: Assets.icons.location,
                            isPassword: false,
                          ),
                          SizedBox(height: 8),
                          //======================CONTACT======================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.contact.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.aniFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 80.h,
                            child: IntlPhoneField(
                              decoration: InputDecoration(
                                fillColor: AppColors.aniFlashWhite,
                                filled: true,
                                labelText: 'Phone Number',
                                labelStyle: TextStyle( fontSize: 16.sp),
                                maintainHintSize: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                              ),
                              initialCountryCode: 'AU',
                              onChanged: (phone) {
                                controller.contactNumber = phone.completeNumber;
                                print(phone.completeNumber);
                              },
                            ),
                          ),
                          //===================PASSWORD=========================//
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.password.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.aniFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            hintText: AppStrings.enterPassword.tr,
                            controller: controller.passwordController,
                            borderRadius: 10,
                            isPassword: true,
                          ),
                          SizedBox(height: 8),
                          //===================CONFIRM PASSWORD=========================//
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.confirmPassword.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.aniFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            hintText: AppStrings.confirmPassword.tr,
                            controller: controller.confirmPasswordController,
                            borderRadius: 10,
                            isPassword: true,
                          ),
                          SizedBox(height: 20.h,),
                          //===================BUTTON=========================//
                          ButtonWidget(label: AppStrings.signUp.tr,
                            fontWeight: FontWeight.w700,
                            backgroundColor: AppColors.greenPrimary,
                            buttonWidth: double.infinity,
                            buttonHeight: 60.h,
                            onPressed: (){
                            if( controller.singupFormKey.currentState!.validate() ){
                              print("Form is valid");
                            }else{
                              print("Form is invalid");
                            }
                            //Get.toNamed(AppRoutes.mainNavScreen);
                            },
                          ),
                          SizedBox(height: 30.h,),
                          //===================DIVIDER=========================//
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppColors.greyB8,
                                  height: 2.h,
                                  endIndent: 4.w,
                                ),
                              ),
                              TextWidget(
                                text: AppStrings.or.tr,
                                fontColor: AppColors.aniFlashWhite,
                                //fontFamily: FontFamily.openSans,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                figmaLetterSpacing: -5,
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppColors.greyB8,
                                  height: 2.h,
                                  indent: 4.w,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          //===================GOOGLE/FACEBOOK/APPLE=========================//
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 15.w,
                            children: [
                              BorderedIconButton(
                                  iconName: Assets.icons.googleLogin,
                                  onClick: (){}
                              ),
                              BorderedIconButton(
                                  iconName: Assets.icons.facebookLogin,
                                  onClick: (){}
                              ),
                              BorderedIconButton(
                                  iconName: Assets.icons.appleLogin,
                                  onClick: (){}
                              ),
                            ],
                          ),
                          SizedBox(height: 60.h,),
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
