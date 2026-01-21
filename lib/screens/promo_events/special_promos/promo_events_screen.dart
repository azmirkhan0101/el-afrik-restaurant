import 'package:el_afrik_restaurant/controllers/product/product_controller.dart';
import 'package:el_afrik_restaurant/data/models/product/product_model.dart';
import 'package:el_afrik_restaurant/screens/promo_events/special_promos/widgets/promo_tab.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpecialPromosScreen extends StatelessWidget {

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {

    controller.getAllPromotionEvents();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(AppStrings.promotionEvents.tr, style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              // ---------------- TAB BAR ----------------
              TabBar(
                indicator: BoxDecoration(),
          dividerColor: Colors.transparent,
          labelColor: AppColors.greenPrimary,
          unselectedLabelColor: AppColors.grey72,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w900,
            color: AppColors.black,
            fontSize: 16,
          ),
          tabs: [
            Tab(text: 'Holiday'),
            Tab(text: 'Weekend'),
            Tab(text: 'Limited'),
          ],
        ),
              SizedBox(height: 12.h),

              // ---------------- TAB VIEW ----------------
              Expanded(
                child: TabBarView(
                  children: [
                    Obx((){
                      return PromoTab(
                          promoProducts: controller.promoEventProducts.value
                      );
                    }),
                    Obx((){
                      return PromoTab(
                          promoProducts: controller.promoEventProducts.value
                      );
                    }),
                    Obx((){
                      return PromoTab(
                          promoProducts: controller.promoEventProducts.value
                      );
                    }),
                  ],
                ),
              ),
              SizedBox( height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}
