import 'package:el_afrik_restaurant/controllers/home/home_controller.dart';
import 'package:el_afrik_restaurant/data/models/home/category/category_model.dart';
import 'package:el_afrik_restaurant/data/models/product/product_model.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/home/home/widgets/custom_drawer.dart';
import 'package:el_afrik_restaurant/screens/home/home/widgets/filter_dialog.dart';
import 'package:el_afrik_restaurant/screens/home/home/widgets/image_slider.dart';
import 'package:el_afrik_restaurant/widgets/top_flavour_card/top_flavour_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/category_item/category_item.dart';
import '../../../widgets/text_widget/text_widgets.dart';

class HomeScreen extends StatelessWidget {

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Scaffold(
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
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.notificationScreen);
              },
              icon: Icon(Icons.notifications, color: AppColors.greenPrimary),
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: RefreshIndicator(
          backgroundColor: Colors.white,
          color: AppColors.greenPrimary,
          onRefresh: () async {
            controller.getCategoryList();
            controller.getTopFlavourProducts();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 5.w,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(Assets.icons.loyaltyPoint),
                    Text("1250 Point"),
                    SizedBox(width: 10.w,)
                  ],
                ),
                SizedBox(height: 10.h),
                //===================SEARCH - FILTER=========================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    spacing: 6.w,
                    children: [
                      Expanded(
                        child: SearchBar(
                          enabled: false,
                          constraints: BoxConstraints(
                            maxHeight: 55.h,
                            minHeight: 55.h,
                          ),
                          padding: WidgetStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 10),
                          ),
                          hintText: AppStrings.search.tr,
                          hintStyle: WidgetStatePropertyAll(
                            TextStyle(color: Colors.grey),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
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
                      GestureDetector(
                        onTap: () {
                          showFilterDialog(context);
                        },
                        child: Container(
                          height: 50.h,
                          width: 56.h,
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.greenPrimary,
                          ),
                          child: SvgPicture.asset(Assets.icons.filter),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                //===================IMAGE SLIDER=========================//
                ImageSlider(),
                //===================CATEGORIES - VIEW ALL=========================//
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: AppStrings.categories.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.categoriesScreen);
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
                categoryItems(context),
                SizedBox(height: 15.h),
                //===================EL AFRIK TOP FLAVOURS - VIEW ALL=========================//
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: AppStrings.elAfrikTopFlavours.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.topFlavoursScreen);
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
                topFlavoursItems(context),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //CATEGORY ITEMS
  categoryItems(BuildContext context) {
    return Obx((){
      if( controller.isCategoryLoading.value ){
        return Center(child: CircularProgressIndicator(color: AppColors.greenPrimary,));
      }else{
        return SizedBox(
          height: 110.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index){

                CategoryModel model = controller.categories[index];
                return CategoryItem(
                    height: 100,
                    width: 100,
                    imageHeight: 60,
                    imageWidth: 85,
                    imagePath: model.imagePath,
                    categoryName: model.categoryName,
                  onClick: (){
                      controller.getCategoryProducts(categoryId: model.id);
                    Get.toNamed(AppRoutes.categoryProductsScreen, arguments: model);
                  },
                );
              }),
        );
      }
    });
  }

  //TOP FLAVOURS ITEMS
  topFlavoursItems(BuildContext context) {
    return Obx((){
      if( controller.isTopFlavoursLoading.value ){
        return Padding(
          padding: EdgeInsets.only(top: 45.h),
          child: Center(child: CircularProgressIndicator(color: AppColors.greenPrimary,)),
        );
      }
      if( controller.topFlavours.isEmpty ){
        return Center(child: Text("No Top Flavours Yet!"));
      }
      return SizedBox(
        height: 290.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.topFlavours.length,
            itemBuilder: (context, index){
          final ProductModel model = controller.topFlavours[index];
          return TopFlavourCard(
              imageUrl: model.imageUrl,
              title: model.name,
              subtitle: model.description,
              price: model.discountedPrice ?? model.price,
              deliveryTime: model.readyTime,
              rating: 4.5,
              points: model.points,
            onPressed: (){
                Get.toNamed(AppRoutes.topFlavoursDetailsScreen, arguments: model);
            },
          );
        }),
      );
    });
  }

  //FILTERS
  void showFilterDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) => const FilterDialog(),
      transitionBuilder: (context, anim1, anim2, child) {
        // Offset(1, 0) starts it completely off-screen to the right
        // Offset(0, 0) is the final resting position (center)
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOutQuad)),
          child: child,
        );
      },
    );
  }
}