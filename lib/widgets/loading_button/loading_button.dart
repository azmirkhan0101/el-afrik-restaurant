import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors/app_colors.dart';

class LoadingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double buttonRadius;
  final Widget? widget;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  final bool isLoading;
  final Color loaderColor;

  const LoadingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.buttonRadius = 12,
    this.widget,
    this.isLoading = false,
    this.loaderColor = AppColors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.fontColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBgColor = backgroundColor ?? AppColors.greenPrimary;

    return SizedBox(
      width: width?.w,
      height: height?.h ?? 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBgColor,
          // This prevents the button from turning grey when onPressed is null
          disabledBackgroundColor: effectiveBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular( buttonRadius.r ),
          ),
          elevation: 0,
        ),
        // Keep onPressed null to prevent double-taps while loading
        onPressed: isLoading ? null : onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: isLoading ? 0 : 1,
              child: widget ??
                  Text(
                    text,
                    style: TextStyle(
                      color: fontColor,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                    ),
                  ),
            ),
            if (isLoading) // Use conditional rendering for cleaner layout
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: loaderColor,
                  // Ensure no background color is set on the spinner itself
                  backgroundColor: Colors.transparent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
