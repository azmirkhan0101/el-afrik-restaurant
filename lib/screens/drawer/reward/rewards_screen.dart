import 'package:el_afrik_restaurant/data/models/promo/promo_events_model.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/drawer/reward/widgets/reward_item_widget.dart';
import 'package:el_afrik_restaurant/screens/promo_events/promo_events/widgets/promo_item_widget.dart';
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

    final List<PromoEventsModel> promoEvents = [
      PromoEventsModel(
        id: '1',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Food Festival',
        description: 'Fresh organic meals',
        date: '12 Dec',
        promoCode: '10 points',
        discountPercentage: 20.0,
      ),
      PromoEventsModel(
        id: '2',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Vegan Green Expo',
        description: 'Plant-based delights',
        date: '15 Dec',
        promoCode: '15 points',
        discountPercentage: 15.0,
      ),
      PromoEventsModel(
        id: '3',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'BBQ Grill Master',
        description: 'Smoked meats & ribs',
        date: '18 Dec',
        promoCode: '35 points',
        discountPercentage: 10.0,
      ),
      PromoEventsModel(
        id: '4',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Italian Pasta Night',
        description: 'Homemade artisan pasta',
        date: '20 Dec',
        promoCode: '20 points',
        discountPercentage: 25.0,
      ),
      PromoEventsModel(
        id: '5',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Pizza Carnival',
        description: 'Wood-fired sourdough',
        date: '22 Dec',
        promoCode: '80 points',
        discountPercentage: 30.0,
      ),
      PromoEventsModel(
        id: '6',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Asian Street Food',
        description: 'Authentic night market',
        date: '24 Dec',
        promoCode: '25 points',
        discountPercentage: 50.0,
      ),
      PromoEventsModel(
        id: '7',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Pastry & Dessert Gala',
        description: 'Sweet treats & cakes',
        date: '26 Dec',
        promoCode: '10 points',
        discountPercentage: 5.0,
      ),
      PromoEventsModel(
        id: '8',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Seafood Spectacular',
        description: 'Fresh catch of the day',
        date: '28 Dec',
        promoCode: '25 points',
        discountPercentage: 15.0,
      ),
      PromoEventsModel(
        id: '9',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Healthy Bowls Summit',
        description: 'Nutritious salad bowls',
        date: '30 Dec',
        promoCode: '30 points',
        discountPercentage: 20.0,
      ),
      PromoEventsModel(
        id: '10',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Taco Tuesday Festival',
        description: 'Mexican street tacos',
        date: '02 Jan',
        promoCode: '60 points',
        discountPercentage: 10.0,
      ),
    ];


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

                  return RewardItemWidget(
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
              SizedBox( height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}
