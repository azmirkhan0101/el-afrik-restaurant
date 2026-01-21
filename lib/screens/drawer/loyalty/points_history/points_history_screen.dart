import 'package:el_afrik_restaurant/screens/drawer/loyalty/points_history/earned_tab.dart';
import 'package:el_afrik_restaurant/screens/drawer/loyalty/points_history/expired_tab.dart';
import 'package:el_afrik_restaurant/screens/drawer/loyalty/points_history/used_tab.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class PointsHistoryScreen extends StatelessWidget {
  const PointsHistoryScreen({super.key});

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
              child: CircleAvatar(
                radius: 22.r,
                backgroundImage: AssetImage(Assets.dummy.userPhoto.keyName,),
              ),
            )
          ],
        ),
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Center(child: TextWidget(text: AppStrings.availablePoints.tr, fontWeight: FontWeight.w900,),),
            Center(child: TextWidget(text: "1250",fontSize: 30, fontWeight: FontWeight.w700,),),
            Center(child: TextWidget(text: "Last Update 09:34 AM 17/11/2025", ),),
            SizedBox(height: 15.h,),
            //
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    // ----------------TAB BAR----------------
                    TabBar(
                      onTap: (index) {
                        //tabIndex.value = index;
                      },
                      indicatorColor: Colors.transparent,
                      indicator: BoxDecoration(),
                      dividerHeight: 0,
                      labelColor: AppColors.greenPrimary,
                      unselectedLabelColor: AppColors.grey72,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                        fontSize: 16.sp,
                      ),
                      tabs: [
                        Tab(text: 'Earned'),
                        Tab(text: 'Used'),
                        Tab(text: 'Expired'),
                      ],
                    ),

                    SizedBox(height: 12.h),
                    // ---------------- TAB VIEW ----------------
                    Expanded(
                      child: TabBarView(
                        children: [
                          EarnedTab(),
                          UsedTab(),
                          ExpiredTab()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
        ),
      ),
    );
  }
}
