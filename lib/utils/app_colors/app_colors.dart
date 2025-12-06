import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  
  AppColors._();


  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey72 = Color(0xFF727272);
  static const Color greenShade = Color(0xFFB0E7C6);
  static const Color greenPrimary = Color(0xFF00B047);
  static const Color gradientEnd = Color(0xFF34C759);

  static const LinearGradient greenGradient = LinearGradient(
      colors: [
        AppColors.white,
        gradientEnd
      ],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentGeometry.bottomCenter
  );
}