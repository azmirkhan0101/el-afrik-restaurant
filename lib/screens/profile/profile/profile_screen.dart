import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(text: AppStrings.profile.tr,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontColor: AppColors.black,
        ),
        centerTitle: true,
        actions: [
          //==================EDIT ICON BUTTON=======================
          IconButton(onPressed: (){
            Get.toNamed(AppRoutes.editProfileScreen);
          }, icon: Icon(Icons.edit, color: AppColors.black,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Center(
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.r,
                      color: AppColors.greenPrimary,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(Assets.dummy.userPhoto.keyName,
                    ),
                  ),
                ),
              ),
              SizedBox( height: 15.h,),
              //==================NAME========================
              Center(child: TextWidget(
                  text: "Ashikur Rahman",
                fontWeight: FontWeight.w700,
              )
              ),
              SizedBox( height: 5.h,),
              //==================ADDRESS========================
              Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: TextWidget(
                                    text: "Philadelphia, USA",
                      fontColor: AppColors.black32,
                      fontSize: 16,
                                  ),
                  )
              ),
              SizedBox( height: 20.h,),
              //=====================USER NAME==========================
              TextWidget(text: AppStrings.userName.tr),
              SizedBox( height: 8.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: TextWidget(
                  textAlignment: TextAlign.left,
                    text: "ashikur123",
                fontColor: AppColors.black32,
                ),
              ),
              SizedBox( height: 20.h,),
              //=====================EMAIL===========================
              TextWidget(text: AppStrings.email.tr),
              SizedBox( height: 8.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(12.r)
                ),
                child: TextWidget(
                  textAlignment: TextAlign.left,
                  text: "abc@mail.com",
                  fontColor: AppColors.black32,
                ),
              ),
              SizedBox( height: 20.h,),
              //=====================CONTACT NUMBER===========================
              TextWidget(text: AppStrings.contactNo.tr),
              SizedBox( height: 8.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(12.r)
                ),
                child: TextWidget(
                  textAlignment: TextAlign.left,
                  text: "+971 0945 3458",
                  fontColor: AppColors.black32,
                ),
              ),
              SizedBox( height: 20.h,),
              //=====================DATE OF BIRTH===========================
              TextWidget(text: AppStrings.dateOfBirth.tr),
              SizedBox( height: 8.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(12.r)
                ),
                child: TextWidget(
                  textAlignment: TextAlign.left,
                  text: "09 Jan 1994",
                  fontColor: AppColors.black32,
                ),
              ),
              SizedBox( height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}
