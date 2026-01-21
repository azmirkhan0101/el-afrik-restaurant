import 'package:el_afrik_restaurant/controllers/main_nav/main_nav_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderCompletedScreen extends StatelessWidget {
  const OrderCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox.expand(
        child: Column(
          spacing: 10.h,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.greenPrimary,
              ),
              child: Icon(
                Icons.done,
                size: 60.r,
                fontWeight: FontWeight.w900,
                color: AppColors.white,
              ),
            ),
            TextWidget(
              text: AppStrings.orderCompleted.tr,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(text: AppStrings.name.tr),
                TextWidget(text: AppStrings.contact.tr),
                TextWidget(text: AppStrings.address.tr),
                TextWidget(text: AppStrings.deliveryDate.tr),
                TextWidget(text: AppStrings.deliveryTime.tr),
              ],
            ),
            TextWidget(
              text: AppStrings.yourOrderHasBeenCompleted.tr,
              fontColor: Colors.blueAccent,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.rateUsScreen);
              },
              child: TextWidget(
                text: AppStrings.rateElAfrik.tr,
                fontColor: AppColors.greenPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: ButtonWidget(
                label: AppStrings.backToHome.tr,
                backgroundColor: AppColors.white,
                borderWidth: 1.r,
                borderColor: AppColors.orange,
                textColor: AppColors.orange,
                onPressed: () {
                  Get.find<MainNavController>().changePageIndex(index: 0);
                  Get.until((route) {
                    return route.settings.name == AppRoutes.mainNavScreen;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
