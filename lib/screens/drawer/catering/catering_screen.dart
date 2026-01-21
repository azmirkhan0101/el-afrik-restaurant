import 'package:el_afrik_restaurant/controllers/drawer/catering_controller.dart';
import 'package:el_afrik_restaurant/core/app_validator.dart';
import 'package:el_afrik_restaurant/screens/drawer/catering/widgets/catering_text_field.dart';
import 'package:el_afrik_restaurant/screens/drawer/catering/widgets/radio_button_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:el_afrik_restaurant/widgets/places_search_field/places_search_field.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CateringScreen extends StatelessWidget {
  RxInt currentRadioButton = 0.obs;
  final CateringController controller = Get.find<CateringController>();
  final GlobalKey<FormState> cateringFormKey = GlobalKey<FormState>();
  final String googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(
          text: AppStrings.cateringReservation.tr,
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
            key: cateringFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                TextWidget(
                  text: AppStrings.bookCateringForEvents.tr,
                  textAlignment: TextAlign.left,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 5.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.whiteF5,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextWidget(
                    text:
                        "${AppStrings.minimumOrderForCatering.tr} \$100. ${AppStrings.weProvideCateringForUpTo} 5000 guests.",
                    textAlignment: TextAlign.left,
                    fontSize: 18,
                    fontColor: AppColors.black55,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                TextWidget(text: AppStrings.fullName.tr),
                SizedBox(height: 8.h),
                //=====================FULL NAME==========================
                CateringTextField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Full name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                TextWidget(text: AppStrings.phoneNumber.tr),
                SizedBox(height: 8.h),
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
                      fillColor: AppColors.offWhite,
                      filled: true,
                      labelText: 'Phone Number',
                      labelStyle: TextStyle( fontSize: 16.sp),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      maintainHintSize: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  //initialCountryCode: 'AU',
                  onChanged: (phone) {
                    controller.phoneNumberController.text = phone.completeNumber;
                  },
                ),
                SizedBox(height: 20.h),
                //=====================EMAIL===========================
                TextWidget(text: AppStrings.email.tr),
                SizedBox(height: 8.h),
                CateringTextField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Email is required";
                    }
                    if( !isEmailValid(email: value) ){
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                //=====================EVENT DATE===========================
                TextWidget(text: AppStrings.eventDate.tr),
                SizedBox(height: 8.h),
                CustomDatePicker(
                  onDateSelected: (date) {
                    if (date != null) {
                      controller.dateTime = date.toUtc();
                    }
                  },
                  firstDay: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                  lastDay: DateTime(DateTime.now().year+1, 12, 31, 23, 59, 59),
                  validator: (value){
                    if(value == null){
                      return "Event date is required";
                    }
                    return null;
                  },
                  initialYear: DateTime.now().year,
                  firstYear: DateTime.now().year,
                  lastYear: DateTime.now().year + 1,
                ),
                SizedBox(height: 20.h),
                //=====================NUMBER OF GUESTS===========================
                TextWidget(text: AppStrings.numberOfGuests.tr),
                SizedBox(height: 8.h),
                CateringTextField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Number of guests is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                //=====================ADDRESS===========================
                TextWidget(text: AppStrings.addressLocation.tr),
                SizedBox(height: 8.h),
                PlacesSearchField(
                  backgroundColor: AppColors.whiteF5,
                    googleApiKey: googleApiKey,
                    textEditingController: controller.addressController,
                    onItemClick: (value){
                    },
                    validator: (value, context){
                      if( value == null || value.isEmpty ){
                        return "Address is required";
                      }
                      return null;
                    },
                    focusNode: focusNode
                ),
                SizedBox(height: 20.h),
                //===============RADIO BUTTONS=============================
                TextWidget(text: AppStrings.foodPackage.tr),
                SizedBox(height: 8.h),
                Obx(() {
                  return RadioButtonWidget(
                    currentSelection: currentRadioButton.value,
                    onChanged: (value) {
                      if (value != null) {
                        currentRadioButton.value = value;
                      }
                    },
                  );
                }),
                SizedBox(height: 20.h),
                //=====================INSTRUCTIONS===========================
                TextWidget(text: AppStrings.writeSpecialInstructions.tr),
                SizedBox(height: 8.h),
                CateringTextField(maxLines: 4),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
        child: Obx((){
          return LoadingButton(
            buttonRadius: 100,
            onPressed: (){
              if(cateringFormKey.currentState!.validate()){
                controller.requestCatering();
              }
            },
            text: AppStrings.requestCatering.tr,
          isLoading: controller.isCateringRequestLoading.value,
          );
        }),
      ),
    );
  }
}
