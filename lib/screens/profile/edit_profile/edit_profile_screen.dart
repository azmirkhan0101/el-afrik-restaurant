import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/profile/edit_profile/widgets/edit_profile_textfield.dart';
import 'package:el_afrik_restaurant/screens/profile/edit_profile/widgets/photo_edit_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class EditProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(text: AppStrings.editProfile.tr,
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
              PhotoEditWidget(),
              SizedBox( height: 15.h,),
              //==================NAME========================
              Center(child: TextWidget(
                text: "Ashikur Rahman",
                fontWeight: FontWeight.w700,
              ),
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
              EditProfileTextField(
                hintText: "ashikur123",
              ),
              SizedBox( height: 20.h,),
              //=====================EMAIL===========================
              TextWidget(text: AppStrings.email.tr),
              SizedBox( height: 8.h,),
              EditProfileTextField(
                hintText: "abc@mail.com",
              ),
              SizedBox( height: 20.h,),
              //=====================CONTACT NUMBER===========================
              TextWidget(text: AppStrings.contactNo.tr),
              SizedBox( height: 8.h,),
              EditProfileTextField(
                hintText: "+971 0945 3458",
              ),
              SizedBox( height: 20.h,),
              //=====================DATE OF BIRTH===========================
              TextWidget(text: AppStrings.dateOfBirth.tr),
              SizedBox( height: 8.h,),
              EditProfileTextField(
                hintText: "09 Jan 1994",
              ),
              SizedBox( height: 20.h,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: ButtonWidget(label: AppStrings.confirm.tr),
      ),
    );
  }
}
