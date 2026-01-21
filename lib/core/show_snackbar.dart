//SHOW SNACKBAR
import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../utils/app_colors/app_colors.dart';

showSnackBar({required String title, required String message, required Color backgroundColor, Color textColor = AppColors.white}) {
  Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor
  );
}


noInternetSnackBar() {
  Get.snackbar(
      "No internet!",
      "Please check your internet connection and try again",
      backgroundColor: AppColors.warningYellow,
      colorText: AppColors.white
  );
}


errorSnackBar() {
  Get.snackbar(
      "Error occurred!",
      "Something went wrong. Please try again.",
      backgroundColor: AppColors.errorRed,
      colorText: AppColors.white
  );
}

timeOutSnackBar() {
  Get.snackbar(
      "Time out!",
      "Please check your internet connection or try again later.",
      backgroundColor: AppColors.errorRed,
      colorText: AppColors.white
  );
}