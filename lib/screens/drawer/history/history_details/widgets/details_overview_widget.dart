import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsOverviewWidget extends StatelessWidget {
  const DetailsOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h,),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: "${AppStrings.totalProducts.tr} 3",),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xff7700ff).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r)
                ),
                child: TextWidget(text: AppStrings.pending.tr, fontColor: Color(0xff7700ff),),
              )
            ],
          ),
          TextWidget(text: "Price: \$50.00"),
          TextWidget(text: "Delivery fee: \$5.00"),
          TextWidget(text: "Date: 22 Dec 2025 11:15 AM"),
        ],
      ),
    );
  }
}
