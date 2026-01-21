import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class PickupScreen extends StatelessWidget {
  const PickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(AppStrings.pickup.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(Assets.images.pickupGraphics.keyName,
            height: 305.h,
              width: 305.w,
              fit: BoxFit.cover,
            ),
           Spacer(),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 30.w),
             child: ButtonWidget(label: AppStrings.pickup.tr,
             buttonRadius: 100,
             onPressed: (){
               Get.toNamed(AppRoutes.completedScreen);
             },
             ),
           ),
           SizedBox(height: 50.h,)
          ],
        ),
      ),
    );
  }
}
