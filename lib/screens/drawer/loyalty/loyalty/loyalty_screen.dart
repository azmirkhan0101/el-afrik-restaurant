import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/drawer/loyalty/loyalty/widgets/loyalty_overview_card.dart';
import 'package:el_afrik_restaurant/screens/order/order/widgets/tab_page.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_constants/app_constants.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class LoyaltyScreen extends StatelessWidget {
  LoyaltyScreen({super.key});

  RxInt tabIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Image.asset(
            Assets.images.logo.keyName,
            height: 61.h,
            width: 109.w,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: GestureDetector(
                onTap: (){

                },
                child: CircleAvatar(
                  radius: 22.r,
                  backgroundImage: AssetImage(Assets.dummy.userPhoto.keyName,),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ----------------TAB BAR----------------
                TabBar(
                  onTap: (index) {
                    tabIndex.value = index;
                  },
                  indicatorColor: Colors.transparent,
                  indicator: BoxDecoration(),
                  dividerHeight: 0,
                  labelColor: AppColors.orange,
                  unselectedLabelColor: AppColors.grey72,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                    fontSize: 16.sp,
                  ),
                  tabs: [
                    Tab(text: 'Silver'),
                    Tab(text: 'Gold'),
                    Tab(text: 'Platinum'),
                  ],
                ),
          
                SizedBox(height: 12.h),
                // ---------------- TAB VIEW ----------------
                SizedBox(
                  height: 230.h,
                  child: TabBarView(
                    children: [
                      LoyaltyOverviewCard(tier: silver),
                      LoyaltyOverviewCard(tier: gold),
                      LoyaltyOverviewCard(tier: platinum),
                    ],
                  ),
                ),
                SizedBox( height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.rewardIcon, height: 30, width: 30,),
                        TextWidget(text: AppStrings.rewards.tr, fontWeight: FontWeight.w700,),
                      ],
                    ),
                    TextButton(onPressed: (){}, child: TextWidget(text: AppStrings.viewAll.tr, fontWeight: FontWeight.w500, fontColor: AppColors.grey72,)
                    )
                    ],
                ),
                Divider(thickness: 2, color: AppColors.greyCA,),
                ListTile(
                  leading: Icon(Icons.loyalty, color: AppColors.orange,),
                  title: TextWidget(text: "10% OFF", textAlignment: TextAlign.left,),
                  trailing: Container(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h,),
                    decoration: BoxDecoration(
                      color: AppColors.greenPrimary,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextWidget(text: AppStrings.claim.tr, fontColor: AppColors.white,),
                    ),
                ),
                SizedBox(height: 5.h,),
                ListTile(
                  leading: Icon(Icons.loyalty, color: AppColors.orange,),
                  title: TextWidget(text: "10% OFF", textAlignment: TextAlign.left,),
                  trailing: Container(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h,),
                    decoration: BoxDecoration(
                        color: AppColors.greenPrimary,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextWidget(text: AppStrings.claim.tr, fontColor: AppColors.white,),
                  ),
                ),
                SizedBox(height: 5.h,),
                ListTile(
                  leading: Icon(Icons.loyalty, color: AppColors.orange,),
                  title: TextWidget(text: "10% OFF", textAlignment: TextAlign.left,),
                  trailing: Container(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h,),
                    decoration: BoxDecoration(
                        color: AppColors.greenPrimary,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextWidget(text: AppStrings.claim.tr, fontColor: AppColors.white,),
                  ),
                ),
                SizedBox(height: 5.h,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.pointHistoryScreen);
                  },
                  child: Row(
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_rounded, size: 30.r, color: AppColors.orange,),
                          TextWidget(text: AppStrings.pointHistory.tr, fontWeight: FontWeight.w700,),
                        ],
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward_ios_rounded)
                      )
                    ],
                  ),
                ),
                Divider(thickness: 2, color: AppColors.greyCA,),
                Obx((){
                  if( tabIndex.value == 2 ){//PLATINUM TAB
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: ButtonWidget(
                      label: AppStrings.vipEvents.tr,
                      buttonRadius: 100,
                      onPressed: (){
                        Get.toNamed(AppRoutes.rewardsScreen);
                      },
                    ),
                    );
                  }else{
                    return SizedBox.shrink();
                  }
                }),
                Row(
                  spacing: 8.w,
                  children: [
                    Icon(Icons.newspaper_rounded, size: 30.r, color: AppColors.orange,),
                    TextWidget(text: AppStrings.howItWorks.tr, fontWeight: FontWeight.w700,),
                  ],
                ),
                Divider(thickness: 2, color: AppColors.greyCA,),
                SizedBox(height: 10.h,),
                TextWidget(text: AppStrings.earnPointsOnEveryOrder.tr, fontWeight: FontWeight.w700,),
                SizedBox(height: 4.h,),
                TextWidget(text: AppStrings.everyTimeYouPlaceAnOrder.tr, fontWeight: FontWeight.w500, textAlignment: TextAlign.left,),
                SizedBox(height: 10.h,),
                TextWidget(text: AppStrings.redeemPointsForRewards.tr, fontWeight: FontWeight.w700,),
                SizedBox(height: 4.h,),
                TextWidget(text: AppStrings.useYourPointsToUnlock.tr, fontWeight: FontWeight.w500, textAlignment: TextAlign.left,),
                SizedBox(height: 10.h,),
                TextWidget(text: AppStrings.moreWaysToEarn.tr, fontWeight: FontWeight.w700,),
                SizedBox(height: 4.h,),
                TextWidget(text: AppStrings.bonusPointsOnSpecialEvents.tr, fontWeight: FontWeight.w500, textAlignment: TextAlign.left,),
                SizedBox(height: 40.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
