import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/api_service.dart';
import 'package:el_afrik_restaurant/core/show_snackbar.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/api_endpoints/api_endpoints.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {

  final ApiService apiService = Get.find<ApiService>();

  String email = "";

  @override
  void onInit() {
    email = Get.arguments;
    super.onInit();
  }

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RxBool isPasswordChanging = false.obs;
  
  //RESET PASSWORD
  resetPassword() async{

    if( isPasswordChanging.value ){
      return;
    }
    isPasswordChanging.value = true;
    Map<String, dynamic> payLoad = {
      "email": email,
      "newPassword": passwordController.text.trim()
    };
    ApiResponse response = await apiService.networkRequest(
        method: "POST",
        isAuthRequired: false,
        endPoint: ApiEndpoints.resetPassword,
      body: payLoad
    );
    isPasswordChanging.value = false;
    if( response.statusCode == 200 ){
      showSnackBar(title: "Done!", message: "Password has been reset.", backgroundColor: AppColors.greenPrimary);
      Get.offAndToNamed( AppRoutes.loginScreen );
    }else if( response.statusCode == 404 ){
      showSnackBar(title: "No account found!", message: "No account found with this email.", backgroundColor: AppColors.warningYellow);
    }else if( response.statusCode == 408 ){
      timeOutSnackBar();
    }else if( response.statusCode == 503 ){
      noInternetSnackBar();
    }else{
      errorSnackBar();
    }

  }
}