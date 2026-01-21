import 'package:el_afrik_restaurant/controllers/auth/sign_up_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:el_afrik_restaurant/widgets/profile_avatar/profile_avatar.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../core/app_validator.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/custom_text_field/custom_text_field.dart';
import '../../../widgets/places_search_field/places_search_field.dart';
import '../login/components/bordered_icon_button.dart';

class SignupScreen extends StatelessWidget {


  final String googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
  final FocusNode focusNode = FocusNode();

  final GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();

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
            leading: IconButton(onPressed: (){
              Get.offAllNamed( AppRoutes.authSelectionScreen );
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: singupFormKey,
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
                              fontColor: AppColors.antiFlashWhite,
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
                                  isPassword: false,validator: (value){
                                  if( value == null || value.isEmpty ){
                                    return "Last name is required";
                                  }
                                  return null;
                                },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          //==================EMAIL==========================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.emailAddress.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            hintText: AppStrings.enterEmail.tr,
                            controller: controller.emailController,
                            borderRadius: 10,
                            prefixIcon: Assets.icons.email,
                            validator: (value){
                              if( value == null || value.isEmpty ){
                                return "Email is required";
                              }
                              if( !isEmailValid(email: controller.emailController.text.trim()) ){
                                return "Enter valid email address";
                              }
                            return null;
                          },
                          ),
                          SizedBox(height: 8),
                          //==================DATE OF BIRTH=====================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.dateOfBirth.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomDatePicker(
                              onDateSelected: (date){
                            controller.dateOfBirth = date;
                          },
                            validator: (value){
                                if( value == null ){
                                  return "Date of birth is required";
                                }
                                return null;
                            },
                            firstDay: DateTime(1920),
                            lastDay: DateTime.now(),
                            initialYear: DateTime.now().year,
                            firstYear: 1920,
                            lastYear: DateTime.now().year,
                          ),
                          SizedBox(height: 8),
                          //===================LOCATION======================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.location.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          PlacesSearchField(
                              googleApiKey: googleApiKey,
                              textEditingController: controller.locationController,
                              hintText: "Location",
                              prefixIconPath: Assets.icons.location,
                              onItemClick: (value){
                              },
                              focusNode: focusNode,
                            validator: (value, context){
                                if( value == null || value.isEmpty ){
                                    return "Location is required";
                                  }
                                return null;
                            },
                          ),
                          SizedBox(height: 8),
                          //======================CONTACT======================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.contact.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                      IntlPhoneField(
                        validator: (phone){
                          if( phone == null || phone.number.isEmpty ){
                            return "Phone number is required";
                          }
                          try{
                            if( !phone.isValidNumber() ){
                              return "Invalid phone number";
                            }
                          }catch(e){
                            return "Invalid phone number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: AppColors.antiFlashWhite,
                            filled: true,
                            labelText: 'Phone Number',
                            labelStyle: TextStyle( fontSize: 16.sp),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            maintainHintSize: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        initialCountryCode: 'AU',
                        onChanged: (phone) {
                          controller.contactNumber = phone.completeNumber;
                          print(phone.completeNumber);
                        },
                      ),
                          //===================PASSWORD=======================
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.password.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            hintText: AppStrings.enterPassword.tr,
                            controller: controller.passwordController,
                            borderRadius: 10,
                            isPassword: true,
                            validator: (value){
                              if( !isPasswordValid(password: controller.passwordController.text.trim() ) ){
                                return "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8),
                          //=================CONFIRM PASSWORD==============
                          Align(
                            alignment: Alignment.topLeft,
                            child: TextWidget(
                              text: AppStrings.confirmPassword.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.antiFlashWhite,
                              figmaLetterSpacing: -2,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextField(
                            hintText: AppStrings.confirmPassword.tr,
                            controller: controller.confirmPasswordController,
                            borderRadius: 10,
                            isPassword: true,
                            validator: (value){
                              if( controller.passwordController.text != controller.confirmPasswordController.text ){
                                return "Passwords do not match";
                              }
                            return null;
                          },
                          ),
                          SizedBox(height: 20.h,),
                          //===================SIGNUP BUTTON=========================
                          Obx((){
                            return LoadingButton(
                              width: double.infinity,
                              text: AppStrings.signUp.tr,
                              isLoading: controller.isSignupLoading.value,
                              onPressed: (){
                                if( singupFormKey.currentState!.validate() ){
                                  print("Form is valid");
                                  controller.signup();
                                }else{
                                  print("Form is invalid");
                                }
                              }
                            );
                          }),
                          SizedBox(height: 30.h,),
                          //===================DIVIDER========================
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
                                fontColor: AppColors.antiFlashWhite,
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
                          //=============GOOGLE/FACEBOOK/APPLE=================
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 15.w,
                            children: [
                              BorderedIconButton(
                                  iconName: Assets.icons.googleLogin,
                                  onClick: (){
                                    controller.signUpWithGoogle();
                                  }
                              ),
                              BorderedIconButton(
                                  iconName: Assets.icons.facebookLogin,
                                  onClick: (){

                                  }
                              ),
                              BorderedIconButton(
                                  iconName: Assets.icons.appleLogin,
                                  onClick: (){

                                  }
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
