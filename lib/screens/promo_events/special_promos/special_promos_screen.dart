import 'package:el_afrik_restaurant/data/models/promo/promo_events_model.dart';
import 'package:el_afrik_restaurant/screens/promo_events/special_promos/widgets/promo_tab.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class SpecialPromosScreen extends StatelessWidget {

  SpecialPromosScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<PromoEventsModel> promoEvents = [
      PromoEventsModel(
        id: '1',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Food Festival',
        description: 'Fresh organic meals',
        date: '12 Dec',
        promoCode: '2er54fc',
        discountPercentage: 20.0,
      ),
      PromoEventsModel(
        id: '2',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Vegan Green Expo',
        description: 'Plant-based delights',
        date: '15 Dec',
        promoCode: 'VEGAN22',
        discountPercentage: 15.0,
      ),
      PromoEventsModel(
        id: '3',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'BBQ Grill Master',
        description: 'Smoked meats & ribs',
        date: '18 Dec',
        promoCode: 'FIRE10',
        discountPercentage: 10.0,
      ),
      PromoEventsModel(
        id: '4',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Italian Pasta Night',
        description: 'Homemade artisan pasta',
        date: '20 Dec',
        promoCode: 'ITALY25',
        discountPercentage: 25.0,
      ),
      PromoEventsModel(
        id: '5',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Pizza Carnival',
        description: 'Wood-fired sourdough',
        date: '22 Dec',
        promoCode: 'SLICEIT',
        discountPercentage: 30.0,
      ),
      PromoEventsModel(
        id: '6',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Asian Street Food',
        description: 'Authentic night market',
        date: '24 Dec',
        promoCode: 'ASIA50',
        discountPercentage: 50.0,
      ),
      PromoEventsModel(
        id: '7',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Pastry & Dessert Gala',
        description: 'Sweet treats & cakes',
        date: '26 Dec',
        promoCode: 'SWEET5',
        discountPercentage: 5.0,
      ),
      PromoEventsModel(
        id: '8',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Seafood Spectacular',
        description: 'Fresh catch of the day',
        date: '28 Dec',
        promoCode: 'OCEAN15',
        discountPercentage: 15.0,
      ),
      PromoEventsModel(
        id: '9',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Healthy Bowls Summit',
        description: 'Nutritious salad bowls',
        date: '30 Dec',
        promoCode: 'HEALTHY',
        discountPercentage: 20.0,
      ),
      PromoEventsModel(
        id: '10',
        imageUrl: Assets.dummy.topFlavourItem.keyName,
        title: 'Taco Tuesday Festival',
        description: 'Mexican street tacos',
        date: '02 Jan',
        promoCode: 'TACO123',
        discountPercentage: 10.0,
      ),
    ];


    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text(AppStrings.specialPromos.tr),
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
            fontSize: 16.sp,
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
                    PromoTab(
                        promoEvents: promoEvents
                    ),
                    PromoTab(
                        promoEvents: promoEvents
                    ),
                    PromoTab(
                        promoEvents: promoEvents
                    ),
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
