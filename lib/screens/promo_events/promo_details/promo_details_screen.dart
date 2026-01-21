import 'package:el_afrik_restaurant/screens/promo_events/special_promos/widgets/promo_item_widget.dart';
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
                  //     return PromoItemWidget(
                  //         imageUrl: model.imageUrl,
                  //         title: model.title,
                  //         subtitle: model.description,
                  //         date: model.date,
                  //         promoCode: model.promoCode,
                  //       onViewPressed: () {
                  //           //REOPEN THIS SCREEN WITH NEW MODEL DATA
                  //       },
                  //     );
                  //   },
                  // ),
                  SizedBox( height: 20.h,)
                ],
              ),
            ),
          )
      ),
    );
  }
}
