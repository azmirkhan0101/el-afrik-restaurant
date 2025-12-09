import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/button_widget/button_widget.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(Assets.images.noInternet.keyName,
              height: 160.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
            SizedBox( height: 15.h,),
            TextWidget(text: AppStrings.noInternetConnection.tr,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            Spacer(),
        Padding(
          padding: EdgeInsets.symmetric( horizontal: 25.w ),
          child: ButtonWidget(label: AppStrings.retry.tr,
            buttonRadius: 100,
            onPressed: (){

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
