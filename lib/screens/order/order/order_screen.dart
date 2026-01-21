import 'package:el_afrik_restaurant/screens/order/order/widgets/tab_page.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {

  OrderScreen({super.key});

  RxInt tabIndex = 0.obs;

  @override
  Widget build(BuildContext context) {

    List<Color> tabColors = [
      AppColors.orangeRed,
      AppColors.greenPrimary,
      AppColors.red
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text( AppStrings.order.tr,
           style: TextStyle( fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: SizedBox.shrink()
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // ---------------- TAB BAR ----------------
              Obx((){
                return TabBar(
                  onTap: (index){
                    tabIndex.value = index;
                  },
                  indicatorColor: AppColors.black,
                  labelColor: tabColors[tabIndex.value],
                  unselectedLabelColor: AppColors.grey72,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                    fontSize: 15,
                  ),
                  tabs: [
                    Tab(text: 'Ongoing'),
                    Tab(text: 'Delivered'),
                    Tab(text: 'Cancelled'),
                  ],
                );
              }),

              SizedBox(height: 12.h),

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
