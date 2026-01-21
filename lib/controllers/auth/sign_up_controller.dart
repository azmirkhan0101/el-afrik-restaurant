import 'dart:io';

import 'package:el_afrik_restaurant/auth/auth_service.dart';
import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/app_validator.dart';
import '../../core/show_snackbar.dart';
import '../../routes/app_routes/app_routes.dart';
import '../../utils/api_endpoints/api_endpoints.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_constants/app_constants.dart';

class SignUpController extends GetxController {

  final AuthService authService = AuthService();

  final ApiService apiService = Get.find<ApiService>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String contactNumber = "";
  late DateTime? dateOfBirth;

  final Rx<File?> profileImage = Rx<File?>(null);

  final storage = GetStorage();
  RxBool isSignupLoading = false.obs;

  //SIGN UP
  Future<void> signup() async {
    if (!isPhoneNumberValid(number: contactNumber)) {
      showSnackBar(
        title: "Phone number is required!",
        message: "",
        backgroundColor: AppColors.warningYellow,
      );
      return;
    }

    if (isSignupLoading.value) {
      return;
    }

    isSignupLoading.value = true;

    Map<String, dynamic> signupPayload = {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "location": locationController.text.trim(),
      "contact": contactNumber,
      "dob": "${dateOfBirth?.toUtc().toIso8601String()}",
      "fcmToken": "kdbcbfdfkjcdhskljoidj"
    };

    final ApiResponse response = await apiService.multipartRequest(
      isAuthRequired: false,
        endPoint: ApiEndpoints.signup,
        fields: signupPayload,
        fileKey: "image",
        method: "POST"
    );

    isSignupLoading.value = false;

    if ( response.statusCode == 201 ) {//ACCOUNT CREATED
      showSnackBar(title: "Account Created", message: "Successfully created account.", backgroundColor: AppColors.greenPrimary);

      storage.write( emailKey, emailController.text.trim() );
      storage.write( requireVerificationKey, true );
      Map<String, dynamic> arguments = {
        emailKey : emailController.text.trim(),
        isSignupKey : true
      };
      Get.offAndToNamed( AppRoutes.otpVerifyScreen, arguments: arguments );
    }else if( response.statusCode == 400 ){//PHONE NUMBER EXISTS
      showSnackBar(title: "Failed!", message: "Phone number already exist.", backgroundColor: AppColors.errorRed);
    }else if (response.statusCode == 409) {//USER ALREADY EXISTS
      showSnackBar(
        title: "User Exists!",
        message: "User already exist with this email. Try login instead.",
        backgroundColor: AppColors.warningYellow,
      );
    }else if (response.statusCode == 408) {//TIME OUT
      timeOutSnackBar();
    }else if (response.statusCode == 503) {//NO INTERNET
      noInternetSnackBar();
    } else {
      errorSnackBar();
    }
  }

  //SIGN UP WITH GOOGLE
  signUpWithGoogle() async{
    try{
      GoogleSignInAccount signInAccount = await authService.signInWithGoogle();
      GoogleSignInAuthentication signInAuthentication = authService.getAuthTokens( signInAccount );
      String displayName = signInAccount.displayName ?? "";
      String email = signInAccount.email ?? "";
      String id = signInAccount.id ?? "";
      String idToken = signInAuthentication.idToken ?? "";
      String? image = getHighResImageUrl(signInAccount.photoUrl);
      print("Display Name: $displayName");
      print("Email: $email");
      print("Image: $image");
      print("IdToken: $idToken");
      print("Id: $id");
    }catch(e){

    }
  }

  String? getHighResImageUrl(String? url) {
    if (url == null) return null;
    return url.replaceAll('s96-c', 's500-c');
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    locationController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
