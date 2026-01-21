import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';

class CateringTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CateringTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLines,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h), // Slightly less vertical padding for text entry comfort
      decoration: BoxDecoration(
        color: AppColors.whiteF5,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(
          color: AppColors.black32,
          fontSize: 16, // Adjust based on your TextWidget defaults
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.black32.withOpacity(0.8),
            fontSize: 14.sp,
          ),
          border: InputBorder.none, // Removes the default underline/outline
          isDense: true,            // Makes the field compact to respect container padding
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        ),
      ),
    );
  }
}