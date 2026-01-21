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

class EditAddressScreen extends StatelessWidget {

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
        title: TextWidget(text: AppStrings.editAddress.tr,
          fontSize: 22,
          fontWeight: FontWeight.w900,
          fontColor: AppColors.black,
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
                SizedBox( height: 20.h,),
                //=====================USER NAME=======================
                TextWidget(text: AppStrings.name.tr),
                SizedBox( height: 8.h,),
                EditProfileTextField(
                  hintText: AppStrings.writeYourName,
                  validator: (value){
                    if( value == null || value.isEmpty ){
                      return "Name is required";
                    }
                    return null;
                  },
                  controller: controller.fullNameController,
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
                      labelStyle: TextStyle( fontSize: 16),
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
                TextWidget(text: AppStrings.deliveryAddress.tr),
                SizedBox( height: 8.h,),
               PlacesSearchField(
                 backgroundColor: AppColors.offWhite,
                   googleApiKey: googleApiKey,
                   textEditingController: controller.addressController,
                   onItemClick: (item){

                   },
                   focusNode: focusNode
               )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: Obx((){
        return LoadingButton(text: AppStrings.confirm.tr,
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
