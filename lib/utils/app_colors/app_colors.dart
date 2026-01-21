import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  
  AppColors._();


  static const Color red = Color(0xFFFF0A0A);
  static const Color errorRed = Color(0xFFF54A45);
  static const Color redCancel = Color(0xFFCE502A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color antiFlashWhite = Color(0xFFFDFDFD);
  static const Color offWhite = Color(0xFFEBEBEB);
  static const Color whiteF5 = Color(0xFFF5F5F5);
  static const Color black = Color(0xFF000000);
  static const Color black32 = Color(0xFF323232);
  static const Color black55 = Color(0xFF555555);
  static const Color blackTitle = Color(0xFF1D242D);
  static const Color blackSubtitle = Color(0xFF2B4E63);
  static const Color grey72 = Color(0xFF727272);
  static const Color greyB8 = Color(0xFFB8B8B8);
  static const Color greyCA = Color(0xFFCACACA);
  static const Color orange = Color(0xFFFCA91B);
  static const Color orangeRed = Color(0xFFFF7D29);
  static const Color yellowWarning = Color(0xFFFFC804);
  static const Color warningYellow = Color(0xffffcc00);
  static const Color greenShade = Color(0xFFB0E7C6);
  static const Color categoryGreen = Color(0xFFCADFC5);
  static const Color greenPrimary = Color(0xFF00B047);
  static const Color gradientEnd = Color(0xFF34C759);

  //NOT ACTUAL COLOR NAME - USAGE NAME ONLY
  static const Color silverColor = Color(0xFFF8E5DF);
  static const Color goldColor = Color(0xFFFEE4B8);
  static const Color platinumColor = Color(0xFFB0E7C6);

  static const LinearGradient greenGradient = LinearGradient(
      colors: [
        AppColors.white,
        gradientEnd
      ],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentGeometry.bottomCenter
  );
}