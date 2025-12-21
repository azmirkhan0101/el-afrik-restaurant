import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_constants/app_constants.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoyaltyOverviewCard extends StatelessWidget {

  final String tier;
  const LoyaltyOverviewCard({
    super.key,
    required this.tier
  });

  @override
  Widget build(BuildContext context) {

    Color backgroundColor;

    if( tier == silver ){
      backgroundColor = AppColors.silverColor;
    }else if( tier == gold ){
      backgroundColor = AppColors.goldColor;
    }else{//platinum
      backgroundColor = AppColors.platinumColor;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        children: [
          Row(
            children: [
              TextWidget(text: "Alan Smith", fontSize: 20, fontWeight: FontWeight.w700,)
            ],
          ),
        ],
      ),
    );
  }
}
