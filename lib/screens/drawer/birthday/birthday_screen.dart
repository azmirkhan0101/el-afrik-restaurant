import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/appbar/appbar_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/button_widget/button_widget.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(AppStrings.birthdayReward.tr),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h,),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.images.birthdayCone.keyName,
                height: 22.h,
                  width: 22.w,
                  fit: BoxFit.cover,
                ),
                TextWidget(text: "${AppStrings.happyBirthday.tr}     ",
                fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                Image.asset(Assets.images.birthdayCone.keyName,
                  height: 22.h,
                  width: 22.w,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox( height: 25.h,),
          Center(
            child: Image.asset(Assets.images.happyBirthday.keyName,
            height: 270.h,
              width: 315.w,
            ),
          ),
          SizedBox( height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 30.w),
            child: TextWidget(text: AppStrings.birthdayGiftJustForYou.tr,
            fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 30.w, vertical: 15.h),
            child: TextWidget(text: AppStrings.enjoyAFreeDessert.tr,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 30.w),
            child: TextWidget(text: "${AppStrings.validFor.tr} 7 ${AppStrings.days.tr}",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 31.w ),
            child: ButtonWidget(label: AppStrings.claimReward.tr,
              buttonRadius: 100,
              onPressed: (){
              showClaimDialog();
              },
            ),
          ),
          SizedBox(height: 50.h,)
        ],
      ),
    );
  }

  //CLAIM DIALOG
  showClaimDialog() async{
    Get.dialog(
        AlertDialog(
          backgroundColor: AppColors.white,
          title: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(Assets.images.birthdayCone.keyName,
                    height: 80.h,
                    width: 80.w,
                  ),
                  Image.asset(Assets.gifs.confetti.keyName,
                    height: 210.h,
                    width: 210.w,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
          content: Text(
            AppStrings.happyBirthday + " " + AppStrings.doYouWantToClaim.tr,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          actions: [
            Row(
              spacing: 10.w,
              children: [
                // Cancel button
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                        color: AppColors.greenPrimary,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: CupertinoColors.inactiveGray, width: 2.r)
                    ),
                    child: TextButton(
                      onPressed: (){
                        Get.back();
                        showRewardDialog();
                      },
                      child: const Text(
                        AppStrings.claimNow,
                        style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // Delete button
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.redCancel,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextButton(
                      onPressed: (){
                        Get.back();
                      },
                      child: const Text(
                        AppStrings.cancel,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  //reward DIALOG
  showRewardDialog() async{
    Get.dialog(
        AlertDialog(
          backgroundColor: AppColors.white,
          title: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(Assets.gifs.confetti.keyName,
                    gaplessPlayback: true,
                    height: 210.h,
                    width: 210.w,
                    fit: BoxFit.fill,
                  ),
                  Image.asset(Assets.gifs.doneAnimation.keyName,
                    gaplessPlayback: true,
                    height: 120.h,
                    width: 120.w,
                  ),
                ],
              ),
            ],
          ),
          content: Text(
            AppStrings.yourBirthdayReward.tr,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          actions: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                height: 42,
                decoration: BoxDecoration(
                    color: AppColors.greenPrimary,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: CupertinoColors.inactiveGray, width: 2.r)
                ),
                child: TextButton(
                  onPressed: (){
                    Get.back();
                    Get.offAndToNamed(AppRoutes.rewardsScreen);
                  },
                  child: const Text(
                    AppStrings.reward,
                    style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
