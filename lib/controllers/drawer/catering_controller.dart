import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api_service.dart';
import '../../core/app_validator.dart';
import '../../utils/app_colors/app_colors.dart';

class CateringController extends GetxController{

  final ApiService apiServices = Get.find<ApiService>();

  RxBool isCateringRequestLoading = false.obs;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberOfGuestsController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();
  late DateTime dateTime;

  //REQUEST CATERING
  requestCatering() async{
    if (isCateringRequestLoading.value) {
      return;
    }

    if (!isPhoneNumberValid(number: phoneNumberController.text.trim())) {
      showSnackBar(
        title: "Phone number is required!",
        message: "",
        backgroundColor: AppColors.warningYellow,
      );
      return;
    }

    isCateringRequestLoading.value = true;
    Map<String, dynamic> body = {
      "fullName": fullNameController.text.trim(),
      "phoneNumber": phoneNumberController.text.trim(),
      "email": emailController.text.trim(),
      "eventDate": dateTime.toIso8601String(),
      "numberOfGuests": numberOfGuestsController.text.trim(),
      "address": addressController.text.trim(),
      "instructions": instructionsController.text.trim(),
      "foodPackage": "standard"
    };
    print(dateTime.toIso8601String());
    ApiResponse response = await apiServices.networkRequest(
        method: "POST",
        isAuthRequired: true,
        endPoint: "",//TODO: PASS ENDPOINT!!!!!!!!!!!!!!!
      body: body
    );
    isCateringRequestLoading.value = false;

    if( response.statusCode == 200 ){

    }else if( response.statusCode == 400 ){

    }else if( response.statusCode == 401 ){

    }else if( response.statusCode == 408 ){
      timeOutSnackBar();
    }else if( response.statusCode == 500 ){
      noInternetSnackBar();
    }else{
      errorSnackBar();
    }

  }


}