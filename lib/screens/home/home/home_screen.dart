import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/home/home/widgets/custom_drawer.dart';
import 'package:el_afrik_restaurant/screens/home/home/widgets/image_slider.dart';
import 'package:el_afrik_restaurant/widgets/top_flavour_card/top_flavour_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/category_item/category_item.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        iconTheme: IconThemeData(color: AppColors.greenPrimary),
        title: Image.asset(
          Assets.images.logo.keyName,
          height: 61.h,
          width: 109.w,
        ),
        centerTitle: true,
        //leading: Icon(Icons.menu, color: AppColors.greenPrimary),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: AppColors.greenPrimary),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            //===================SEARCH - FILTER=========================//
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                spacing: 6.w,
                children: [
                  Expanded(
                    child: SearchBar(
                      constraints: BoxConstraints(maxHeight: 55.h, minHeight: 55.h),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 10),
                      ),
                      hintText: AppStrings.search.tr,
                      hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
                      backgroundColor: WidgetStateProperty.all(Colors.transparent),
                      elevation: WidgetStateProperty.all(0),
                      leading: SvgPicture.asset(Assets.icons.search),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.w),
                          side: BorderSide(color: Colors.grey, width: 1.w),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 56.h,
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.greenPrimary,
                    ),
                    child: SvgPicture.asset(Assets.icons.filter,
                    ),
                  )
                ]
              ),
            ),
            SizedBox( height: 10.h,),
            //===================IMAGE SLIDER=========================//
            ImageSlider(),
            //===================CATEGORIES - VIEW ALL=========================//
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: AppStrings.categories.tr,
                  fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed( AppRoutes.categoriesScreen);
                    },
                    child: TextWidget(
                      text: AppStrings.viewAll.tr,
                      fontSize: 14,
                      fontColor: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            //===================HORIZONTAL SCROLL CATEGORY ITEMS=========================//
            categoryItems(),
            SizedBox(height: 15.h),
            //===================EL AFRIK TOP FLAVOURS - VIEW ALL=========================//
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: AppStrings.elAfrikTopFlavours.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed( AppRoutes.topFlavoursScreen);
                    },
                    child: TextWidget(
                      text: AppStrings.viewAll.tr,
                      fontSize: 14,
                      fontColor: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            topFlavoursItems(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  
  //CATEGORY ITEMS
  categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 15.w),
          CategoryItem(
            height: 100,
            width: 100,
            imageHeight: 62,
            imageWidth: 85,
            imagePath: Assets.dummy.pizza.keyName,
            itemName: "Pizza",
          ),
          SizedBox(width: 5.w),
          CategoryItem(
            height: 100,
            width: 100,
            imageHeight: 62,
            imageWidth: 85,
            imagePath: Assets.dummy.pizza.keyName,
            itemName: "Pizza",
          ),
          SizedBox(width: 5.w),
          CategoryItem(
            height: 100,
            width: 100,
            imageHeight: 62,
            imageWidth: 85,
            imagePath: Assets.dummy.pizza.keyName,
            itemName: "Pizza",
          ),
          SizedBox(width: 5.w),
          CategoryItem(
            height: 100,
            width: 100,
            imageHeight: 62,
            imageWidth: 85,
            imagePath: Assets.dummy.pizza.keyName,
            itemName: "Pizza",
          ),
          SizedBox(width: 5.w),
          CategoryItem(
            height: 100,
            width: 100,
            imageHeight: 62,
            imageWidth: 85,
            imagePath: Assets.dummy.pizza.keyName,
            itemName: "Pizza",
          ),
          SizedBox(width: 5.w),
          CategoryItem(
            height: 100,
            width: 100,
            imageHeight: 62,
            imageWidth: 85,
            imagePath: Assets.dummy.pizza.keyName,
            itemName: "Pizza",
          ),
          SizedBox(width: 5.w),
        ],
      ),
    );
  }
  
  //TOP FLAVOURS ITEMS
  topFlavoursItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 12.w,
        children: [
          SizedBox(width: 10.w),
          TopFlavourCard(
              imageUrl: "",
              title: "Crazy tacko",
              subtitle: "Delicouse tackos, appetizing...",
              price: 45.5,
              deliveryTime: "40-50min",
              rating: 9.5,
              points: 10
          ),
          TopFlavourCard(
              imageUrl: "",
              title: "Crazy tacko",
              subtitle: "Delicouse tackos, appetizing...",
              price: 45.5,
              deliveryTime: "40-50min",
              rating: 9.5,
              points: 10
          ),
          TopFlavourCard(
              imageUrl: "",
              title: "Crazy tacko",
              subtitle: "Delicouse tackos, appetizing...",
              price: 45.5,
              deliveryTime: "40-50min",
              rating: 9.5,
              points: 10
          ),
          TopFlavourCard(
              imageUrl: "",
              title: "Crazy tacko",
              subtitle: "Delicouse tackos, appetizing...",
              price: 45.5,
              deliveryTime: "40-50min",
              rating: 9.5,
              points: 10
          ),
          SizedBox(width: 15.w),
        ],
      ),
    );
  }

}
