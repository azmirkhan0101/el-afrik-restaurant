import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors/app_colors.dart';
import '../text_widget/text_widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final double prefixIconSize;
  final Color prefixIconColor;
  final IconData? icon;
  final double? iconHeight;
  final double? iconWidth;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final double buttonHeight;
  final double? buttonWidth;
  final EdgeInsetsGeometry? padding;
  final double buttonRadius;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final double? iconSize;
  final double borderWidth;

  const ButtonWidget({
    super.key,
    required this.label,
    this.icon,
    this.prefixIcon,
    this.prefixIconSize = 20,
    this.prefixIconColor = AppColors.white,
    this.iconHeight,
    this.iconWidth,
    this.textColor = AppColors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
    this.buttonHeight = 56,
    this.buttonWidth,
    this.padding,
    this.buttonRadius = 8,
    this.backgroundColor = AppColors.greenPrimary,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight.h,
      width: buttonWidth?.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius.r),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: borderWidth.r)
                : BorderSide.none,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Icon(prefixIcon,
                color: prefixIconColor,
                size: prefixIconSize.r,
              ),
            if (prefixIcon != null) SizedBox(width: 12.w),
            TextWidget(
              text: label,
              fontColor: textColor,
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
            ),
            if (icon != null) const SizedBox(width: 12),
            if (icon != null)
              Icon(
                icon,
                color: iconColor ?? textColor,
                size: iconSize ?? fontSize,
              ),
          ],
        ),
      ),
    );
  }
}
