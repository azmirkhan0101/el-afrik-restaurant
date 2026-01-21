import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api_service.dart';
import '../../core/show_snackbar.dart';
import '../../utils/api_endpoints/api_endpoints.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_constants/app_constants.dart';
import '../../utils/app_strings/app_strings.dart';
import '../../utils/assets_gen/assets.gen.dart';

class SettingsController extends GetxController {

  final ApiService apiService = Get.find<ApiService>();

  //PRIVACY POLICY AND TERMS CONDITIONS
  RxString faq = "".obs;
  RxString privacyPolicy = "".obs;
  RxString termsConditions = "".obs;
  RxBool isFaqLoading = false.obs;
  RxBool isPrivacyPolicyLoading = false.obs;
  RxBool isTermsAndConditionsLoading = false.obs;

  //CHANGE PASSWORD
  RxBool isChangePasswordLoading = false.obs;
  final storage = GetStorage();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  //GET PRIVACY POLICY
  getFaq() async {

    if( faq.value.isNotEmpty ){
      return;
    }

    if( isFaqLoading.value ){
      return;
    }

    isFaqLoading.value = true;
    ApiResponse response = await apiService.networkRequest(
        method: "GET",
        isAuthRequired: false,
        endPoint: ApiEndpoints.privacyPolicy
    );
    isFaqLoading.value = false;

    if (response.statusCode == 200) {
      faq.value = response.data['data']['privacyPolicy'];
    }
  }

  //GET PRIVACY POLICY
  getPrivacyPolicy() async {

    if( privacyPolicy.value.isNotEmpty ){
      return;
    }

    if( isPrivacyPolicyLoading.value ){
      return;
    }

    isPrivacyPolicyLoading.value = true;
    ApiResponse response = await apiService.networkRequest(
        method: "GET",
        isAuthRequired: false,
        endPoint: ApiEndpoints.privacyPolicy
    );
    isPrivacyPolicyLoading.value = false;

    if (response.statusCode == 200) {
      privacyPolicy.value = response.data['data']['privacyPolicy'];
    }
  }

  //GET TERMS AND CONDITIONS
  getTermsAndConditions() async {

    if( termsConditions.value.isNotEmpty || isTermsAndConditionsLoading.value ){
      return;
    }

    isTermsAndConditionsLoading.value = true;
    ApiResponse response = await apiService.networkRequest(
    method: "GET",
    isAuthRequired: false,
    endPoint: ApiEndpoints.termsAndConditions
    );
    isTermsAndConditionsLoading.value = false;

    if (response.statusCode == 200) {
      termsConditions.value = response.data['data']['termsCondition'];
    }
  }

  //CHANGE PASSWORD
  changePassword() async{

    if( isChangePasswordLoading.value ){
      return;
    }

    isChangePasswordLoading.value = true;
    Map<String, String> payLoad = {
      "oldPassword" : currentPassword.text.trim(),
      "newPassword" : newPassword.text.trim()
    };
    ApiResponse response = await apiService.networkRequest(
        method: "POST",
        isAuthRequired: true,
        endPoint: ApiEndpoints.changePassword,
      body: payLoad
    );
    isChangePasswordLoading.value = false;

    if( response.statusCode == 200 ){
      saveTokens( response.data );
      currentPassword.clear();
      newPassword.clear();
      confirmPassword.clear();
      Get.back();
      showSnackBar(title: "Password changed!", message: "Your password has been changed successfully.", backgroundColor: AppColors.greenPrimary);
    }else if( response.statusCode == 401 ){
      showSnackBar(title: "Unauthorized!", message: "You are not authorized.", backgroundColor: AppColors.errorRed);
    }else if( response.statusCode == 403 ){
      showSnackBar(title: "Wrong password!", message: "Your current password is wrong.", backgroundColor: AppColors.errorRed);
    }else if (response.statusCode == 408) {//TIME OUT
      timeOutSnackBar();
    }else if (response.statusCode == 503) {//NO INTERNET
      noInternetSnackBar();
    } else {
      errorSnackBar();
    }
  }

  //DELETE ACCOUNT
  deleteAccount() async {

    showDeletingAlert();
    ApiResponse response = await apiService.networkRequest(
        method: "DELETE",
        isAuthRequired: true,
        endPoint: ApiEndpoints.deleteAccount
    );
    if( response.statusCode == 200 ){
      await storage.erase();
      if( Get.isDialogOpen ?? false ){
        Get.back();
      }
      Get.offAllNamed( AppRoutes.onBoardingScreen );
      showDeleteSuccessAlert();
    }else{
      if( Get.isDialogOpen ?? false ){
        Get.back();
      }
      errorSnackBar();
    }
  }


  //DELETE ACCOUNT DIALOG
  void showDeleteDialog() async{
    Get.dialog(
        AlertDialog(
          backgroundColor: AppColors.white,
          title: Column(
            children: [
              Image.asset(Assets.images.warning.keyName,),
              Text(
                AppStrings.warning.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: Text(
            AppStrings.areYouSureToPermanentlyDelete.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.w500
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          actions: [
            Row(
              children: [
                // Cancel button
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: CupertinoColors.inactiveGray, width: 2.r)
                    ),
                    child: TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w), // Spacing between buttons

                // Delete button
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.greenPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () async{
                        Get.back();
                        deleteAccount();
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  //DELETING ALERT
  showDeletingAlert() async{
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: CircularProgressIndicator(color: AppColors.greenPrimary,),),
            SizedBox(
              height: 15.h,
            ),
            Text("Deleting...", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),)
          ],
        ),
      )
    );
  }

  //DELETe SUCCESS ALERT
  showDeleteSuccessAlert() async{
    Get.dialog(
        AlertDialog(
          backgroundColor: AppColors.white,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Success", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.sp),),
              SizedBox(
                height: 15.h,
              ),
              Text(AppStrings.yourAccountDeleted.tr, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),),
              SizedBox(height: 12.h,),
              Container(
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.greenPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () async{
                    Get.back();
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }



  //SAVE TOKENS IN STORAGE
  void saveTokens(Map<String, dynamic> response) {

    final accessToken = response["data"]["accessToken"];
    final refreshToken = response["data"]["refreshToken"];

    storage.write( accessTokenKey, accessToken);
    storage.write( refreshTokenKey, refreshToken);
  }

  @override
  void onClose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
