import 'package:el_afrik_restaurant/data/models/promo/promo_events_model.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/drawer/reward/widgets/reward_item_widget.dart';
import 'package:el_afrik_restaurant/screens/promo_events/special_promos/widgets/promo_item_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(AppStrings.rewards.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox( height: 12.h,),
              //===================ITEMS GRID=========================//
              // GridView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: EdgeInsets.zero,
              //   itemCount: promoEvents.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 8.h,
              //     crossAxisSpacing: 8.w,
              //     mainAxisExtent: 260.h,
              //   ),
              //   itemBuilder: (context, index) {
              //
              //     final PromoEventsModel model = promoEvents[index];
              //
              //     return RewardItemWidget(
              //         imageUrl: model.imageUrl,
              //         title: model.title,
              //         subtitle: model.description,
              //         date: model.date,
              //         promoCode: model.promoCode,
              //         onViewPressed: (){
              //           Get.toNamed(AppRoutes.promosDetailsScreen);
              //         }
              //     );
              //   },
              // ),
              SizedBox( height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}
