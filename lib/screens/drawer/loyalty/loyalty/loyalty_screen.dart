import 'package:el_afrik_restaurant/screens/drawer/loyalty/loyalty/widgets/loyalty_overview_card.dart';
import 'package:el_afrik_restaurant/screens/order/order/widgets/tab_page.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_constants/app_constants.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          title: TextWidget(text: AppStrings.loyaltyProgram.tr,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
          centerTitle: true,
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // ---------------- TAB BAR ----------------
              TabBar(
              onTap: (index){
        tabIndex.value = index;
        },
          indicatorColor: AppColors.black,
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

              LoyaltyOverviewCard(tier: silver ),

              // ---------------- TAB VIEW ----------------
              Expanded(
                child: TabBarView(
                  children: [
                    TabPage(
                      status: "Ongoing",
                      statusColor: AppColors.orange,
                      backgroundColor: Colors.orange.shade50,
                    ),
                    TabPage(
                      status: "Delivered",
                      statusColor: AppColors.greenPrimary,
                      backgroundColor: Colors.green.shade50,
                    ),
                    TabPage(
                      status: "Cancelled",
                      statusColor: AppColors.red,
                      backgroundColor: Colors.red.shade50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
