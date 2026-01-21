import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_afrik_restaurant/controllers/cart/cart_controller.dart';
import 'package:el_afrik_restaurant/data/models/product/product_model.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/expandable_text/expandable_text_widget.dart';
import 'package:el_afrik_restaurant/widgets/icon_button_widget/icon_button_widget.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/models/home/top_flavours/top_flavours_model.dart';
import '../top_flavours/widgets/top_flavour_item.dart';

class TopFlavoursDetailsScreen extends StatelessWidget {

  CartController controller = Get.find<CartController>();

  RxBool isFavourite = true.obs;
  ProductModel? model = Get.arguments;

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
        originalPrice: 20.00,
        // No discount example
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
        originalPrice: 20.00,
        // No discount example
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

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //===================IMAGE AND STACKED BUTTONS===================
                Container(
                  height: 280.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.greenPrimary.withOpacity(0.8),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: model?.imageUrl ?? "",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(color: Colors.white),
                          ),
                          errorWidget: (context, url, error) => Container(
                            child: Icon(
                              Icons.no_food_rounded,
                              size: 70.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: 10,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.white,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                          icon: Icon(Icons.arrow_back, color: AppColors.black),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 10,
                        child: IconButton(
                          onPressed: () {
                            isFavourite.value = !isFavourite.value;
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.white,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                          icon: Obx(() {
                            if (isFavourite.value) {
                              return Icon(
                                Icons.favorite_rounded,
                                color: AppColors.red,
                              );
                            } else {
                              return Icon(
                                Icons.favorite_outline,
                                color: Colors.lightGreen,
                              );
                            }
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                TextWidget(
                  text: model?.name ?? "",
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(height: 20.h),
                TextWidget(
                  text: "\$${model?.price ?? ""}",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.greenPrimary,
                ),
                SizedBox(height: 8.h),
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
                        text: "4.5",
                        backgroundColor: AppColors.whiteF5,
                        textColor: AppColors.black32,
                        textSize: 18,
                      ),
                      IconButtonWidget(
                        iconData: Icons.local_fire_department_rounded,
                        iconSize: 30,
                        iconColor: AppColors.red,
                        text: "${model?.calories ?? 0} Kcal",
                        backgroundColor: AppColors.whiteF5,
                        textColor: AppColors.black32,
                        textSize: 18,
                      ),
                      IconButtonWidget(
                        iconData: Icons.access_time_filled_rounded,
                        iconSize: 30,
                        iconColor: AppColors.greenPrimary,
                        text: model?.readyTime ?? "",
                        backgroundColor: AppColors.whiteF5,
                        textColor: AppColors.black32,
                        textSize: 18,
                      ),
                      IconButtonWidget(
                        iconData: Icons.loyalty,
                        iconSize: 30,
                        iconColor: AppColors.orange,
                        text: "${model?.points ?? 0} point",
                        backgroundColor: AppColors.whiteF5,
                        textColor: AppColors.black32,
                        textSize: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                TextWidget(
                  text: AppStrings.about.tr,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                ),
                //=====================ABOUT=========================
                ExpandableTextWidget(text: model?.description ?? ""),
                SizedBox(height: 20.h),
                //======================BUY NOW-ADD TO CART==========
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 20.w,
                  children: [
                    Expanded(
                      child: LoadingButton(
                        text: AppStrings.buyNow.tr,
                        backgroundColor: AppColors.errorRed,
                        fontSize: 16,
                        onPressed: (){

                        },
                      )
                    ),
                    Expanded(
                      child: Obx((){
                        return LoadingButton(
                          text: AppStrings.addToCart.tr,
                          fontSize: 16,
                          isLoading: controller.isAdding.value,
                          onPressed: (){
                            controller.addItemToCart(id: model?.id ?? "");
                          },
                        );
                      })
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                //===================RECOMMENDED FOR YOU - VIEW ALL=========================//
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: AppStrings.recommendedForYou.tr,
                      fontSize: 18,
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
                    mainAxisExtent: 260.h,
                  ),
                  itemBuilder: (context, index) {
                    final TopFlavoursModel model = dummyModels[index];

                    return TopFlavourItem(
                      imageUrl: model.imageUrl,
                      isFavourite: model.isFavorite,
                      title: model.name,
                      weightInfo: 20,
                      currentPrice: model.currentPrice,
                      originalPrice: model.originalPrice,
                    );
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
