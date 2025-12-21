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
import '../../../utils/assets_gen/assets.gen.dart';
import '../top_flavours/widgets/top_flavour_item.dart';

class TopFlavoursDetailsScreen extends StatelessWidget {
   TopFlavoursDetailsScreen({super.key});

   RxBool isFavourite = true.obs;

  @override
  Widget build(BuildContext context) {

    final List<TopFlavoursModel> dummyModels = [
      TopFlavoursModel(
        id: 'p1',
        name: 'Cheesy Pan Pizza',
        imageUrl: '',
        weightInfo: '(± 50 gm)',
        currentPrice: 22.00,
        originalPrice: 25.00,
        isFavorite: true,
      ),
      TopFlavoursModel(
        id: 'p2',
        name: 'Pepperoni Feast',
        imageUrl: '',
        weightInfo: '(± 60 gm)',
        currentPrice: 18.50,
        originalPrice: 22.00,
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p3',
        name: 'Veggie Supreme',
        imageUrl: '',
        weightInfo: '(± 45 gm)',
        currentPrice: 20.00,
        originalPrice: 20.00, // No discount example
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p4',
        name: 'BBQ Chicken Blast',
        imageUrl: '',
        weightInfo: '(± 70 gm)',
        currentPrice: 24.00,
        originalPrice: 28.50,
        isFavorite: true,
      ),
      TopFlavoursModel(
        id: 'p1',
        name: 'Cheesy Pan Pizza',
        imageUrl: '',
        weightInfo: '(± 50 gm)',
        currentPrice: 22.00,
        originalPrice: 25.00,
        isFavorite: true,
      ),
      TopFlavoursModel(
        id: 'p2',
        name: 'Pepperoni Feast',
        imageUrl: '',
        weightInfo: '(± 60 gm)',
        currentPrice: 18.50,
        originalPrice: 22.00,
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p3',
        name: 'Veggie Supreme',
        imageUrl: '',
        weightInfo: '(± 45 gm)',
        currentPrice: 20.00,
        originalPrice: 20.00, // No discount example
        isFavorite: false,
      ),
      TopFlavoursModel(
        id: 'p4',
        name: 'BBQ Chicken Blast',
        imageUrl: '',
        weightInfo: '(± 70 gm)',
        currentPrice: 24.00,
        originalPrice: 28.50,
        isFavorite: true,
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
                                onPressed: (){
                                  isFavourite.value = !isFavourite.value;
                                },
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(AppColors.white,),
                                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)))
                                ),
                                icon: Obx((){
                                  if( isFavourite.value ){
                                    return Icon(Icons.favorite_rounded, color: AppColors.red,);
                                  }else{
                                    return Icon(Icons.favorite_outline, color: Colors.lightGreen,);
                                  }
                                })
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
                  //======================BUY NOW-ADD TO CART=================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: ButtonWidget(label: AppStrings.buyNow.tr,
                        backgroundColor: Colors.redAccent,
                          onPressed: (){
            
                          },
                        ),
                      ),
                      Expanded(
                        child: ButtonWidget(label: AppStrings.addToCart.tr,
                          backgroundColor: AppColors.greenPrimary,
                          onPressed: (){
            
                          },
                        ),
                      ),
                    ],
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
                    itemCount: dummyModels.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      mainAxisExtent: 280.h,
                    ),
                    itemBuilder: (context, index) {
            
                      final TopFlavoursModel model = dummyModels[index];
            
                      return TopFlavourItem(
                          imageUrl: model.imageUrl,
                          title: model.name,
                          weightInfo: model.weightInfo,
                          currentPrice: model.currentPrice,
                          originalPrice: model.originalPrice
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
