import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class PromoItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final DateTime date;
  final String promoCode;
  final VoidCallback onViewPressed;

  const PromoItemWidget({
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
      padding: EdgeInsets.only(bottom: 8.h),
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
          //Image
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
              child: Container(
                height: 100.h,
                width: double.infinity,
                color: AppColors.greenPrimary.withOpacity(0.65),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.no_food_rounded,
                      size: 70.r,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ),
          ),
          SizedBox( height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title and Subtitle
                TextWidget(
                    text: title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontColor: AppColors.black32,
                ),
                SizedBox(height: 4.h),
                TextWidget(
                  text: subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                    fontColor: AppColors.grey72
                ),
                SizedBox(height: 8.h),

                // 3. Footer Row (Date, Code, Button)
                Column(
                  spacing: 5.h,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 5.w,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.orange,
                          size: 18.r,
                        ),
                        TextWidget(
                          text: DateFormat("dd MMM").format(date),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),

                    Row(
                      spacing: 5.w,
                      children: [
                        Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.orange,
                          size: 18.r,
                        ),
                        Expanded(
                          child: TextWidget(
                            text: promoCode,
                            textAlignment: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
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
                      label: "View",
                    buttonRadius: 100,
                      buttonHeight: 40.h,
                      onPressed: onViewPressed,
                      fontSize: 16,
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
