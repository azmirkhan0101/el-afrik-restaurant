import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_strings/app_strings.dart';
import '../../utils/assets_gen/assets.gen.dart';
import '../button_widget/button_widget.dart';
import '../text_widget/text_widgets.dart';

class NoMenu extends StatelessWidget {

  final VoidCallback? onRetry;

  const NoMenu({
    super.key,
    this.onRetry
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
        ),
        Image.asset(
          Assets.images.noMenuAvailable.keyName,
          height: 100.h,
          width: 100.w,
          fit: BoxFit.contain,
        ),
        SizedBox( height: 15.h,),
        TextWidget(
          text: AppStrings.noMenuAvailable.tr,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        SizedBox( height: 10.h,),
        TextWidget(
          //text: AppStrings.weCouldntLoadTheItems.tr,
          text: "No items found!",
          fontSize: 16,
        ),
        SizedBox(height: 220.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWidget(
                label: AppStrings.retry.tr,
                buttonRadius: 100,
                backgroundColor: AppColors.errorRed,
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                onPressed: onRetry
              ),
              ButtonWidget(
                label: AppStrings.backToHome.tr,
                buttonRadius: 100,
                onPressed: (){
                  Get.offAllNamed(AppRoutes.mainNavScreen);
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 50.h,)
      ],
    );
  }
}
