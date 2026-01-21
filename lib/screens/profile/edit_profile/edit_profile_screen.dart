import 'package:el_afrik_restaurant/controllers/profile/profile_controller.dart';
import 'package:el_afrik_restaurant/screens/profile/edit_profile/widgets/edit_profile_textfield.dart';
import 'package:el_afrik_restaurant/screens/profile/edit_profile/widgets/photo_edit_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../widgets/custom_date_picker/custom_date_picker.dart';
import '../../../widgets/places_search_field/places_search_field.dart';

class EditProfileScreen extends StatelessWidget {

  final ProfileController controller = Get.find<ProfileController>();
  final GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();
  final String googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          AppStrings.editProfile.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: editProfileFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Obx((){
                  return PhotoEditWidget(
                    imageUrl: controller.profileModel.value?.image,
                    onImagePicked: (file){
                      controller.profileImage.value = file;
                    },
                  );
                }),
                SizedBox( height: 15.h,),
                //==================NAME========================
                Center(
                  child: Obx((){
                    return TextWidget(
                      text: "${controller.profileModel.value?.firstName ?? ""} ${controller.profileModel.value?.lastName ?? ""}",
                      fontWeight: FontWeight.w700,
                    );
                  })
                ),
                SizedBox( height: 15.h,),
                //==================ADDRESS========================
                PlacesSearchField(
                  hintText: "Address",
                  padding: [ 12, 0],
                  backgroundColor: AppColors.offWhite,
                  googleApiKey: googleApiKey,
                  textEditingController: controller.addressController,
                  onItemClick: (value){
                  },
                  focusNode: focusNode,
                  validator: (value, context){
                    if( value == null || value.isEmpty ){
                      return "Address is required";
                    }
                    return null;
                  },
                ),
                SizedBox( height: 20.h,),
                //=====================USER NAME=======================
                TextWidget(text: AppStrings.userName.tr),
                SizedBox( height: 8.h,),
                Row(
                  spacing: 8.w,
                  children: [
                    Expanded(
                      child: EditProfileTextField(
                        hintText: "first name",
                        validator: (value){
                          if( value == null || value.isEmpty ){
                            return "First name is required";
                          }
                          return null;
                        },
                        controller: controller.firstNameController,
                      ),
                    ),
                    Expanded(
                      child: EditProfileTextField(
                        hintText: "last name",
                        validator: (value){
                          if( value == null || value.isEmpty ){
                            return "Last name is required";
                          }
                          return null;
                        },
                        controller: controller.lastNameController,
                      ),
                    ),
                  ],
                ),
                SizedBox( height: 20.h,),
                //=====================CONTACT NUMBER======================
                TextWidget(text: AppStrings.contactNo.tr),
                SizedBox( height: 8.h,),
                IntlPhoneField(
                  initialValue: controller.contactNoController.text.trim(),
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
                    controller.contactNoController.text = phone.completeNumber;
                  },
                ),
                SizedBox( height: 0.h,),
                //=====================DATE OF BIRTH=======================
                TextWidget(text: AppStrings.dateOfBirth.tr),
                SizedBox( height: 8.h,),
                CustomDatePicker(
                  dateFormat: 'dd MMM yyyy',
                  initialDate: controller.dateOfBirth,
                  backgroundColor: AppColors.offWhite,
                  onDateSelected: (date){
                    if( date != null ){
                      controller.dateOfBirth = date;
                    }
                  },
                  validator: (value){
                    if( value == null ){
                      return "Date of birth is required";
                    }
                    return null;
                  },
                  firstDay: DateTime(1920),
                  lastDay: DateTime.now(),
                  initialYear: controller.dateOfBirth?.year ?? DateTime.now().year,
                  firstYear: 1920,
                  lastYear: DateTime.now().year,
                ),
                SizedBox( height: 20.h,),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: Obx((){
        return LoadingButton(text: AppStrings.save.tr,
        isLoading: controller.isEditProfileLoading.value,
          onPressed: (){
          if( editProfileFormKey.currentState!.validate() ){
            controller.updateProfile();
          }
          }
        );
      })
      ),
    );
  }
}
