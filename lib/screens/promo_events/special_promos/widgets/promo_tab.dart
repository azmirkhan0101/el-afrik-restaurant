import 'package:el_afrik_restaurant/data/models/promo/promo_events_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes/app_routes.dart';
import '../../promo_events/widgets/promo_item_widget.dart';

class PromoTab extends StatelessWidget {

  final List<PromoEventsModel> promoEvents;

  const PromoTab({
    super.key,
    required this.promoEvents
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: //===================ITEMS GRID=========================//
      GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: promoEvents.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          mainAxisExtent: 260.h,
        ),
        itemBuilder: (context, index) {

          final PromoEventsModel model = promoEvents[index];

          return PromoItemWidget(
              imageUrl: model.imageUrl,
              title: model.title,
              subtitle: model.description,
              date: model.date,
              promoCode: model.promoCode,
              onViewPressed: (){
                Get.toNamed(AppRoutes.promosDetailsScreen);
              }
          );
        },
      ),
    );
  }
}
