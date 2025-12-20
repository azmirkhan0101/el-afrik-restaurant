import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/custom_text_field/custom_text_field.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes/app_routes.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import 'components/bordered_icon_button.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {

  final LoginController controller = Get.find<LoginController>();

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
            text: AppStrings.loginAccount.tr,
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
                          Assets.images.loginGraphics.keyName,
                        height: 315.h,
                        width: 315.w,
                      ),
                      TextWidget(text: AppStrings.gladToMeetYouAgain.tr,
                      fontColor: AppColors.aniFlashWhite,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                      SizedBox(height: 8),
                      //===================EMAIL=========================//
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: AppStrings.emailAddressOrPhoneNumber.tr,
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
                      ),
                      SizedBox(height: 8,),
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
                      //===================FORGOT PASSWORD=========================//
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          child: GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.welcomeScreen);
                            },
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed(AppRoutes.forgotPasswordScreen);
                              },
                              child: TextWidget(text: AppStrings.forgotThePassword.tr,
                                fontColor: AppColors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                figmaLetterSpacing: -5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      //===================BUTTON=========================//
                      ButtonWidget(label: AppStrings.logIn.tr,
                        fontWeight: FontWeight.w700,
                        backgroundColor: AppColors.greenPrimary,
                        buttonWidth: double.infinity,
                        buttonHeight: 60.h,
                        onPressed: (){
                        Get.toNamed( AppRoutes.mainNavScreen);
                        },
                      ),
                      SizedBox(height: 10.h,),
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
                      )
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
