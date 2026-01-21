import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_constants/app_constants.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoyaltyOverviewCard extends StatelessWidget {

  final String tier;
  const LoyaltyOverviewCard({
    super.key,
    required this.tier
  });

  @override
  Widget build(BuildContext context) {

    Color backgroundColor;
    String tierName;

    if( tier == silver ){
      tierName = "Silver";
      backgroundColor = AppColors.silverColor;
    }else if( tier == gold ){
      tierName = "Gold";
      backgroundColor = AppColors.goldColor;
    }else{//platinum
      tierName = "Platinum";
      backgroundColor = AppColors.platinumColor;
    }

    return Container(
      height: 240.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: "Alan Smith", fontSize: 16, fontWeight: FontWeight.w700,),
              TextWidget(text: "980 Point", fontSize: 14, fontWeight: FontWeight.w600,),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(text: TextSpan(
              children: [
                TextSpan(text: "Expires: ", style: TextStyle(color: Colors.red, fontSize: 12)),
                TextSpan(text: "10 Jan 2025", style: TextStyle(color: Colors.black, fontSize: 12)),
              ]
            )),
          ),
          SizedBox(height: 15.h,),
          Align(
            alignment: Alignment.center,
            child: TextWidget(text: tierName),
          ),
          SizedBox( height: 8.h,),
          buildRatingBar("", 0.5),
          SizedBox(height: 15.h,),
          Align(
            alignment: Alignment.center,
            child: TextWidget(text: AppStrings.usingAvailablePoints.tr, fontSize: 14, fontColor: AppColors.grey72,),
          ),
        ],
      ),
    );
  }

  Widget buildRatingBar(String label, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          //Text("$label ★", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
