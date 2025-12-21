import 'package:el_afrik_restaurant/screens/promo_events/promo_events/widgets/promo_item_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/expandable_text/expandable_text_widget.dart';
import 'package:el_afrik_restaurant/widgets/icon_button_widget/icon_button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/models/home/top_flavours/top_flavours_model.dart';
import '../../../data/models/promo/promo_events_model.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import '../../home/top_flavours/widgets/top_flavour_item.dart';

class PromoDetailsScreen extends StatelessWidget {
  const PromoDetailsScreen({super.key});

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

    String aboutText = "Pizza is a beloved dish made with a crispy crust, rich tomato sauce, melted cheese, and a variety of tasty toppings. It’s perfect for sharing, celebrations, or satisfying any craving.";

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //===================IMAGE AND STACKED BUTTONS===================
                  Container(
                    width: double.infinity,
                    color: AppColors.whiteF5,
                    padding: EdgeInsets.symmetric( vertical: 30.h),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            Assets.dummy.pizza.keyName,
                            height: 280.h,
                            width: 280.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 10,
                            child: IconButton(
                                onPressed: (){
                                  Get.back();
                                },
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(AppColors.white,),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)))
                                ),
                                icon: Icon(Icons.arrow_back, color: AppColors.black,
                                )
                            )
                        ),
                        Positioned(
                            top: 0,
                            right: 10,
                            child: IconButton(
                                onPressed: (){},
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(AppColors.white,),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)))
                                ),
                                icon: Icon(Icons.favorite_outlined, color: AppColors.red,
                                )
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  TextWidget(text: "Cheesy Pan Pizza",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 20.h,),
                  TextWidget(text: "\$22.00",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.greenPrimary,
                  ),
                  SizedBox(height: 8.h,),
                  //===================HORIZONTAL ICON BUTTONS==================
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 10.w,
                      children: [
                        IconButtonWidget(
                            iconData: Icons.star_rounded,
                            iconSize: 30,
                            iconColor: AppColors.yellowWarning,
                            text: "4.8",
                            backgroundColor: AppColors.whiteF5,
                            textColor: AppColors.black32,
                            textSize: 18
                        ),
                        IconButtonWidget(
                            iconData: Icons.local_fire_department_rounded,
                            iconSize: 30,
                            iconColor: AppColors.red,
                            text: "150 Kcal",
                            backgroundColor: AppColors.whiteF5,
                            textColor: AppColors.black32,
                            textSize: 18
                        ),
                        IconButtonWidget(
                            iconData: Icons.access_time_filled_rounded,
                            iconSize: 30,
                            iconColor: AppColors.greenPrimary,
                            text: "5-10 min",
                            backgroundColor: AppColors.whiteF5,
                            textColor: AppColors.black32,
                            textSize: 18
                        ),
                        IconButtonWidget(
                            iconData: Icons.loyalty,
                            iconSize: 30,
                            iconColor: AppColors.orange,
                            text: "20 point",
                            backgroundColor: AppColors.whiteF5,
                            textColor: AppColors.black32,
                            textSize: 18
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  TextWidget(text: AppStrings.about.tr,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  //=====================ABOUT=========================
                  ExpandableTextWidget(text: aboutText),
                  SizedBox(height: 20.h,),
                  //======================BUY NOW=================
                  ButtonWidget(label: AppStrings.buyNow.tr,
                    backgroundColor: Colors.redAccent,
                    onPressed: (){

                    },
                  ),
                  SizedBox( height:  20.h,),
                  //===================RECOMMENDED FOR YOU - VIEW ALL=========================//
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: AppStrings.recommendedForYou.tr,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      TextButton(
                        onPressed: () {
                          //Get.toNamed( AppRoutes.topFlavoursScreen);
                        },
                        child: TextWidget(
                          text: AppStrings.viewAll.tr,
                          fontSize: 14,
                          fontColor: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                  //============RECOMMENDED ITEMS GRID====================
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
                        onViewPressed: () {
                            //REOPEN THIS SCREEN WITH NEW MODEL DATA
                        },
                      );
                    },
                  ),
                  SizedBox( height: 20.h,)
                ],
              ),
            ),
          )
      ),
    );
  }
}
