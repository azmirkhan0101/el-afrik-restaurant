import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/drawer/catering/widgets/catering_text_field.dart';
import 'package:el_afrik_restaurant/screens/drawer/catering/widgets/radio_button_widget.dart';
import 'package:el_afrik_restaurant/screens/profile/edit_profile/widgets/edit_profile_textfield.dart';
import 'package:el_afrik_restaurant/screens/profile/edit_profile/widgets/photo_edit_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class CateringScreen extends StatelessWidget {

  RxInt currentRadioButton = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(text: AppStrings.cateringReservation.tr,
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
              SizedBox( height: 15.h,),
              //==================NAME========================
              TextWidget(
                text: AppStrings.bookCateringForEvents.tr,
              textAlignment: TextAlign.left,
              fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              SizedBox( height: 5.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w,
                vertical: 8.h
                ),
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: TextWidget(
                  text: "${AppStrings.minimumOrderForCatering.tr} \$100. ${AppStrings.weProvideCateringForUpTo} 5000 guests.",
                  textAlignment: TextAlign.left,
                  fontSize: 18,
                  fontColor: AppColors.black55,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox( height: 20.h,),
              //=====================FULL NAME==========================
              TextWidget(text: AppStrings.fullName.tr),
              SizedBox( height: 8.h,),
              CateringTextField(),
              SizedBox( height: 20.h,),
              TextWidget(text: AppStrings.phoneNumber.tr),
              SizedBox( height: 8.h,),
              CateringTextField(),
              SizedBox( height: 20.h,),
              //=====================EMAIL===========================
              TextWidget(text: AppStrings.email.tr),
              SizedBox( height: 8.h,),
              CateringTextField(),
              SizedBox( height: 20.h,),
              //=====================EVENT DATE===========================
              TextWidget(text: AppStrings.eventDate.tr),
              SizedBox( height: 8.h,),
              CustomDatePicker(onDateSelected: (date){}),
              SizedBox( height: 20.h,),
              //=====================NUMBER OF GUESTS===========================
              TextWidget(text: AppStrings.numberOfGuests.tr),
              SizedBox( height: 8.h,),
              CateringTextField(),
              SizedBox( height: 20.h,),
              //=====================ADDRESS===========================
              TextWidget(text: AppStrings.addressLocation.tr),
              SizedBox( height: 8.h,),
              CateringTextField(),
              SizedBox( height: 20.h,),
              //===============RADIO BUTTONS=============================
              TextWidget(text: AppStrings.foodPackage.tr),
              SizedBox( height: 8.h,),
              Obx((){
                return RadioButtonWidget(
                    currentSelection: currentRadioButton.value,
                    onChanged: (value){
                      if( value != null ){
                        currentRadioButton.value = value;
                      }
                    }
                );
              }),
              SizedBox( height: 20.h,),
              //=====================INSTRUCTIONS===========================
              TextWidget(text: AppStrings.writeSpecialInstructions.tr),
              SizedBox( height: 8.h,),
              CateringTextField(maxLines: 4,),
              SizedBox( height: 40.h,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: ButtonWidget(label: AppStrings.requestCatering.tr),
      ),
    );
  }
}
