import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/button_widget/button_widget.dart';

class NoMenuScreen extends StatelessWidget {
  const NoMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Image.asset(Assets.images.logo.keyName,
          height: 61.h,
          width: 109.w,
        ),
        centerTitle: true,
        leading: Icon(Icons.menu, color: AppColors.greenPrimary,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: AppColors.greenPrimary,))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(Assets.images.noMenuAvailable.keyName,
              height: 160.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
            SizedBox( height: 15.h,),
            TextWidget(text: AppStrings.noMenuAvailable.tr,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            SizedBox( height: 10.h,),
            TextWidget(text: AppStrings.weCouldntLoadTheItems.tr,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonWidget(label: AppStrings.retry.tr,
                    buttonRadius: 100,
                    backgroundColor: AppColors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    onPressed: (){

                    },
                  ),
                  ButtonWidget(label: AppStrings.backToHome.tr,
                    buttonRadius: 100,
                    onPressed: (){

                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h,)
          ],
        ),
      ),
    );
  }
}
