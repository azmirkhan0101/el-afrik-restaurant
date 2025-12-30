import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../core/show_snackbar.dart';
import '../../routes/app_routes/app_routes.dart';
import '../../utils/api_endpoints/api_endpoints.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_constants/app_constants.dart';

class SignUpController extends GetxController {

  final GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String contactNumber = "";
  late final DateTime? dateOfBirth;

  final Rx<File?> profileImage = Rx<File?>(null);


  final TextEditingController nameController = TextEditingController();
  final TextEditingController taglineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController businessPhoneController = TextEditingController();
  final TextEditingController businessEmailController = TextEditingController();
  final TextEditingController businessWebsiteController = TextEditingController();

  final storage = GetStorage();
  RxBool isSignupLoading = false.obs;

  //VALIDATE INFORMATION OF BUSINESS INFO
  void validateBusinessInfo() async{
    if( nameController.text.trim().isEmpty || taglineController.text.trim().isEmpty || descriptionController.text.trim().isEmpty ){
      showSnackBar(
          title: "Information missing!",
          message: "Please enter the required information.",
          backgroundColor: AppColors.errorRed
      );
      return;
    }
    // businessSignupModel.name = nameController.text.trim();
    // businessSignupModel.tagline = taglineController.text.trim();
    // businessSignupModel.description = descriptionController.text.trim();
    // Get.toNamed(AppRoutes.accountCreation);
  }

  //VALIDATE INFORMATION OF ACCOUNT CREATION- EMAIL, PASSWORD
  bool isEmailValid() {
    return RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
    ).hasMatch(emailController.text.trim());
  }
  bool isPasswordValid() {
    final regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~?%^()_\-+=<>.,;:{}\[\]|/]).{8,}$'
    );
    return regex.hasMatch(passwordController.text.trim());
  }
  //BUSINESS PHONE NUMBER VALIDATION
  bool validatePhoneNumber() {
    final regex = RegExp(r'^\+?1?\d{9,15}$');  // Supports optional country code and 9-15 digits
    return regex.hasMatch(businessPhoneController.text.trim());
  }
  //BUSINESS PHONE NUMBER VALIDATION
  bool validateBusinessEmail() {
    return RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'
    ).hasMatch(businessEmailController.text.trim());
  }
  //BUSINESS WEBSITE VALIDATION
  bool isValidWebsiteUrl() {
    if ( businessWebsiteController.text.trim().isEmpty) return false;

    final uri = Uri.tryParse(businessWebsiteController.text.trim());

    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  //VALIDATE ALL BUSINESS CONTACT INFORMATION
  void validateBusinessContactInfo(){
    if( !isValidWebsiteUrl() ){
      showSnackBar(
          title: "Invalid website!",
          message: "Please provide valid business website url.",
          backgroundColor: AppColors.warningYellow
      );
      return;
    }
    if( !validatePhoneNumber() || !validateBusinessEmail() ){
      showSnackBar(
          title: "Invalid information!",
          message: "Please provide valid business contact information.",
          backgroundColor: AppColors.warningYellow
      );
      return;
    }
    // businessSignupModel.businessPhoneNumber = businessPhoneController.text.trim();
    // businessSignupModel.businessEmail = businessEmailController.text.trim();
    // businessSignupModel.businessWebsite = businessWebsiteController.text.trim();
    // Get.toNamed(AppRoutes.storeLocation);
  }


  //ACCOUNT CREATION CONTINUE CLICK -> VALIDATE INFO -> GO TO BUSINESS LOGO SCREEN
  void accountCreationContinue(){
    if( !isEmailValid() || !isPasswordValid() ){
      showSnackBar(
          title: "Invalid Email or Password Format!",
          message: "Please ensure your email is valid and your password meets the specified criteria.",
          backgroundColor: AppColors.warningYellow
      );
      return;
    }
    // businessSignupModel.email = emailController.text.trim();
    // businessSignupModel.password = passwordController.text.trim();
    // Get.toNamed(AppRoutes.uploadLogo);
  }

  //SIGN UP
  Future<void> signup() async {

    if( isSignupLoading.value ){
      return;
    }

    try{
      isSignupLoading.value = true;
      final url = Uri.parse( ApiEndpoints.baseUrl + ApiEndpoints.signup );
      //File? logo = businessSignupModel.logo;

      // Convert model to JSON string (because backend expects "data" as string)
      //final jsonString = jsonEncode(businessSignupModel.toJson());

      // Create multipart request
      var request = http.MultipartRequest("POST", url);

      // Add data field (this is a text field in form-data)
      //request.fields["data"] = jsonString;

      // Add profileImage (optional)
      // if (logo != null) {
      //
      //   final compressedImage = await compressImage( logo );
      //   if( compressedImage != null ){
      //     final mimeType =
      //         lookupMimeType(compressedImage.path)?.split('/') ??
      //             ['application', 'octet-stream'];
      //
      //     request.files.add(
      //         await http.MultipartFile.fromPath(
      //           "logoImage",
      //           compressedImage.path,
      //           contentType: http.MediaType(
      //             mimeType[0],
      //             mimeType[1],
      //           ),
      //         )
      //     );
      //   }
      // }

      // Send request
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var responseData = jsonDecode(responseBody);

      if (response.statusCode == 200 || response.statusCode == 201) {//ACCOUNT CREATED -> SAVE EMAIL -> GO TO OTP VERIFY
        bool isVerificationRequired = responseData['data']['requiresVerification'] ?? false;
        //storage.write( requireVerificationKey, isVerificationRequired );
        //storage.write( emailKey, businessSignupModel.email );//saving for verify now(if user skips verification this time)
        Map<String, dynamic> arguments = {
          emailKey : "",//todo
          isSignupKey : true
        };
        //Get.offAllNamed(AppRoutes.otpVerify, arguments: arguments );
      }else if( response.statusCode == 400 ){//USER ALREADY EXISTS
        showSnackBar(
            title: "User Exists!",
            message: responseData["message"] ?? "User already exist with this email. Try login instead",
            backgroundColor: AppColors.warningYellow
        );
      } else {
        showSnackBar(
            title: "Error occurred!",
            message: responseData["message"] ?? "Something went wrong. Please try again.",
            backgroundColor: AppColors.errorRed
        );
      }
    }catch(e){
      showSnackBar(
          title: "Error occurred!",
          message: "Something went wrong. Please try again.",
          backgroundColor: AppColors.errorRed
      );
    }finally{
      isSignupLoading.value = false;
    }

  }

  //COMPRESS IMAGE
  Future<File?> compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = p.join(
      dir.path,
      '${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 50,// 0 - 100
      format: CompressFormat.jpeg,
    );

    return result != null ? File(result.path) : null;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    businessEmailController.dispose();
    businessPhoneController.dispose();
    businessWebsiteController.dispose();
    nameController.dispose();
    taglineController.dispose();
    descriptionController.dispose();

    super.onClose();
  }
}
