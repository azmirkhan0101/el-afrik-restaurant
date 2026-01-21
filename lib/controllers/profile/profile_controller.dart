import 'dart:io';

import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/show_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api_service.dart';
import '../../data/models/profile/profile_model.dart';
import '../../utils/api_endpoints/api_endpoints.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_constants/app_constants.dart';

class ProfileController extends GetxController{

  final ApiService apiService = Get.find<ApiService>();

  final storage = GetStorage();

  //GET PROFILE
  Rxn<ProfileModel> profileModel = Rxn<ProfileModel>();

  @override
  void onInit() {

    final profile = storage.read( profileModelKey );
    if( profile != null ) {
      profileModel.value = ProfileModel.fromJson(profile);
      //initialize issue!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      initializeEditProfileControllers();
    }else{
      getProfile();
    }

    super.onInit();
  }

  //EDIT PROFILE
  RxBool isEditProfileLoading = false.obs;
  final Rx<File?> profileImage = Rx<File?>(null);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  DateTime? dateOfBirth;

  //INITIALIZE EDIT PROFILE CONTROLLERS
  initializeEditProfileControllers(){
    firstNameController.text = profileModel.value?.firstName ?? "";
    lastNameController.text = profileModel.value?.lastName ?? "";
    fullNameController.text = "${profileModel.value?.firstName ?? ""} ${profileModel.value?.lastName ?? ""}";
    addressController.text = profileModel.value?.location ?? "";
    contactNoController.text = profileModel.value?.contact ?? "";
    dateOfBirth = profileModel.value?.dob;
    print("${profileModel.value?.dob}");
  }

  //GET PROFILE
  getProfile() async{

    ApiResponse response = await apiService.networkRequest(
        method: "GET",
        isAuthRequired: true,
        endPoint: ApiEndpoints.getProfile
    );

    if( response.statusCode == 200 ) { //FETCHED PROFILE DATA
      ProfileModel model = ProfileModel.fromJson(  response.data['data'] );
      //SAVE PROFILE DATA IN STORAGE
      storage.write( profileModelKey, model.toJson() );
      profileModel.value = model;
      initializeEditProfileControllers();
    }
  }

  //UPDATE PROFILE
  updateProfile() async{

    if( isEditProfileLoading.value ){
      return;
    }

    isEditProfileLoading.value = true;
    Map<String, dynamic> payLoad = {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      if( contactNoController.text.trim() != profileModel.value?.contact )
      "contact": contactNoController.text.trim(),
      "location": addressController.text.trim(),
      "dob": dateOfBirth?.toUtc().toIso8601String(),
    };
    ApiResponse response = await apiService.multipartRequest(
        method: "PATCH",
        endPoint: ApiEndpoints.updateProfile,
        isAuthRequired: true,
        fields: payLoad,
        fileKey: "image",
      image: profileImage.value
    );
    isEditProfileLoading.value = false;
    profileImage.value = null;

    if( response.statusCode == 200 ){
      getProfile();
      Get.back();
      showSnackBar(title: "Profile updated!", message: "Your profile has been updated successfully.", backgroundColor: AppColors.greenPrimary);
    }else if( response.statusCode == 401 ){
      showSnackBar(title: "Unauthorized!", message: "You are not authorized.", backgroundColor: AppColors.errorRed);
    }else if( response.statusCode == 408 ){
      timeOutSnackBar();
    }else if( response.statusCode == 503 ){
      noInternetSnackBar();
    }else{
      errorSnackBar();
    }
  }

  @override
  void onClose() {

    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    contactNoController.dispose();
    super.onClose();
  }

}