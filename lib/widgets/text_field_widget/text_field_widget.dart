import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/global_helper/global_helper.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;        // Parent controls initial value
  final String? obscureIcon;     // eye icon
  final IconData? prefixIcon;
  final double borderRadius;
  final bool showCounter;
  final int maxLines;
  final int maxLength;
  final Color borderColor;

  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.obscureIcon,
    this.prefixIcon,
    this.borderRadius = 12,
    this.showCounter = false,
    this.maxLines = 1,
    this.maxLength = 30,
    this.borderColor = AppColors.greyCA,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText; // initial value from parent
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 20.h,
      cursorWidth: 1.w,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: widget.controller,
      obscureText: isObscured, // ← controlled internally
      cursorColor: AppColors.orange,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.aniFlashWhite,
        suffixIconConstraints: BoxConstraints(
          maxHeight: 12.75.h,
          maxWidth: 38.w,
        ),

        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, size: 18.r,),

        // 👇 Toggle Obscure Text
        suffixIcon: widget.obscureIcon == null
            ? null
            : GestureDetector(
          onTap: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: SvgPicture.asset(
              colorFilter: ColorFilter.mode(AppColors.grey72, BlendMode.color),
              widget.obscureIcon!,
              height: 16.h,
              width: 16.w,
            ),
          ),
        ),

        hintText: widget.hint,
        hintStyle: TextStyle(
          color: AppColors.grey72,
          fontSize: 16.sp,
          letterSpacing: letterSpacingFromFigma(-2, 16),
        ),

        contentPadding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 8),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            width: 1.w,
            color: widget.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 1,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.orange,
          ),
        ),
      ),

      buildCounter: (
          BuildContext context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
          }) {
        return !widget.showCounter
            ? SizedBox.shrink()
            : Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
          child: Text(
            "$currentLength / $maxLength",
            style: TextStyle(
              fontSize: 12,
              color: currentLength >= 500 ? Colors.red : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
