import 'dart:async';

import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/show_snackbar.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/api_endpoints/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api_service.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_constants/app_constants.dart';

class OtpVerifyController extends GetxController {

  final ApiService apiService = Get.find<ApiService>();

  final storage = GetStorage();

  late String email;
  late bool isSignup;
  @override
  void onInit() {
    email = Get.arguments[emailKey];
    isSignup = Get.arguments[isSignupKey];
    startTimer();
    super.onInit();
  }

  RxBool isOtpVerifying = false.obs;
  Timer? timer;
  RxInt seconds = 60.obs;
  RxBool isTimerCounting = true.obs;

  final TextEditingController otpController = TextEditingController();

  //TIMER
  startTimer(){
    isTimerCounting.value = true;
    timer?.cancel();
    seconds.value = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer2) {
      if( seconds.value > 0 ){
        seconds--;
      }else{
        timer?.cancel();
        isTimerCounting.value = false;
      }
    });
  }


  //VERIFY SIGNUP OTP
  verifySignupOtp() async{

    if( isOtpVerifying.value ){
      return;
    }

    if( otpController.text.trim().isEmpty || otpController.text.trim().length < 6 ){
      showSnackBar(title: "OTP required!", message: "Please enter the otp and try again.", backgroundColor: AppColors.warningYellow);
      return;
    }

    isOtpVerifying.value = true;
    Map<String, String> payLoad = {
      "email": email,
      "otp": otpController.text.trim()
    };
    ApiResponse response = await apiService.networkRequest(
        method: "POST",
        isAuthRequired: false,
        endPoint: ApiEndpoints.verifySignupOtp,
      body: payLoad
    );
    isOtpVerifying.value = false;

    if( response.statusCode == 200 ){
      showSnackBar(title: "Otp verified!", message: "Otp verified successfully.", backgroundColor: AppColors.greenPrimary);
      storage.write( requireVerificationKey, false );
      saveTokens( response.data );
      Get.offAllNamed( AppRoutes.mainNavScreen );
    }else if( response.statusCode == 400 ){
      showSnackBar(title: "OTP required", message: "Please enter the otp and try again.", backgroundColor: AppColors.warningYellow);
    }else if( response.statusCode == 401 || response.statusCode == 404 ){
      showSnackBar(title: "Invalid otp!", message: "Try again with your valid otp.", backgroundColor: AppColors.errorRed);
    }else if( response.statusCode == 408 ){
      timeOutSnackBar();
    }else if( response.statusCode == 503 ){
      noInternetSnackBar();
    }else{
      errorSnackBar();
    }
  }


  //VERIFY FORGOT PASSWORD OTP
verifyForgotPasswordOtp() async{
  
  if( isOtpVerifying.value ){
    return;
  }

  if( otpController.text.trim().isEmpty || otpController.text.trim().length < 6 ){
    showSnackBar(title: "OTP required!", message: "Please enter the otp and try again.", backgroundColor: AppColors.warningYellow);
    return;
  }

  isOtpVerifying.value = true;
  Map<String, String> payLoad = {
    "email": email,
    "otp": otpController.text.trim()
  };
  ApiResponse response = await apiService.networkRequest(
      method: "POST",
      isAuthRequired: false,
      endPoint: ApiEndpoints.otpVerifyForgotPassword,
    body: payLoad
  );
  isOtpVerifying.value = false;

  if( response.statusCode == 200 ){
    showSnackBar(title: "Otp verified!", message: "Otp verified successfully.", backgroundColor: AppColors.greenPrimary);
    Get.offAndToNamed( AppRoutes.newPasswordScreen, arguments: email );
  }else if( response.statusCode == 400 ){
    showSnackBar(title: "OTP required", message: "Please enter the otp and try again.", backgroundColor: AppColors.warningYellow);
  }else if( response.statusCode == 401 || response.statusCode == 404 ){
    showSnackBar(title: "Invalid otp!", message: "Try again with your valid otp.", backgroundColor: AppColors.errorRed);
  }else if( response.statusCode == 408 ){
    timeOutSnackBar();
  }else if( response.statusCode == 503 ){
    noInternetSnackBar();
  }else{
    errorSnackBar();
  }
}

//SEND OTP
  resendOtp() async{

    Map<String, String> payLoad = {
      "email" : email
    };
    ApiResponse response = await apiService.networkRequest(
        method: "POST",
        isAuthRequired: false,
        endPoint: isSignup ? ApiEndpoints.otpResend : ApiEndpoints.otpForgotPassword,
      body: payLoad
    );

    if( response.statusCode == 200 ){
      showSnackBar(title: "Otp sent", message: "An otp has been sent to your email.", backgroundColor: AppColors.greenPrimary);
      startTimer();
    }else if( response.statusCode == 400 ){
      showSnackBar(title: "Invalid email!", message: "Try again with your valid email.", backgroundColor: AppColors.warningYellow);
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



  //SAVE TOKENS IN STORAGE
  void saveTokens(Map<String, dynamic> response) {

    final accessToken = response["data"]["accessToken"];
    final refreshToken = response["data"]["refreshToken"];

    storage.write( accessTokenKey, accessToken);
    storage.write( refreshTokenKey, refreshToken);
  }
}