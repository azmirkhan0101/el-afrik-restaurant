import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(AppRoutes.checkOutScreen);
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.images.complete.keyName,
              height: 160.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
            SizedBox( height: 15.h,),
            TextWidget(text: "Thank you!",
              fontWeight: FontWeight.w900,
              fontSize: 23,
            ),
            TextWidget(text: "Order Completed",
              fontWeight: FontWeight.w900,
              fontSize: 23,
            ),
          ],
        ),
      ),
    );
  }
}
