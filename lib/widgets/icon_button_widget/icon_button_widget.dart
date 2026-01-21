import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonWidget extends StatelessWidget {

  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final VoidCallback? onPressed;

  IconButtonWidget({
    super.key,
    required this.iconData,
    required this.iconSize,
    required this.iconColor,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.textSize,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric( vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: backgroundColor,
        ),
        child: Row(
          spacing: 5.w,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
            size: iconSize.r,
              color: iconColor,
            ),
            TextWidget(text: text,
            fontColor: textColor,
              fontSize: textSize.sp,
            )
          ],
        ),
      ),
    );
  }
}
