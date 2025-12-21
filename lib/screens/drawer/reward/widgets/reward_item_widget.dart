import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String date;
  final String promoCode;
  final VoidCallback onViewPressed;

  const RewardItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.promoCode,
    required this.onViewPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Image Header
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
            child: Image.asset(
              imageUrl,
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. Title and Subtitle
                TextWidget(
                    text: title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontColor: AppColors.black32,
                ),
                SizedBox(height: 4.h),
                TextWidget(
                  text: subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                    fontColor: AppColors.grey72
                ),
                SizedBox(height: 8.h),

                // 3. Footer Row (Date, Code, Button)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 3.w,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.orange,
                          size: 18.r,
                        ),
                        TextWidget(
                          text: date,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),

                    Row(
                      spacing: 3.w,
                      children: [
                        Icon(
                          Icons.loyalty,
                          color: Colors.orange,
                          size: 18.r,
                        ),
                        TextWidget(
                          text: promoCode,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox( height: 10.h,),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ButtonWidget(
                      label: "Redeem",
                    buttonRadius: 100,
                      buttonHeight: 40.h,
                      onPressed: onViewPressed,
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
