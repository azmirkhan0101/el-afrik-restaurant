import 'package:el_afrik_restaurant/controllers/cart/cart_controller.dart';
import 'package:el_afrik_restaurant/controllers/home/home_controller.dart';
import 'package:el_afrik_restaurant/controllers/product/product_controller.dart';
import 'package:el_afrik_restaurant/data/models/product/product_model.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/home/top_flavours/widgets/top_flavour_item.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class TopFlavoursScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final CartController cartController = Get.find<CartController>();
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(AppStrings.elAfrikTopFlavours.tr, style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getTopFlavourProducts();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //===================SEARCH - FILTER=========================
                Row(
                  spacing: 6.w,
                  children: [
                    Expanded(
                      child: SearchBar(
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
                    Container(
                      height: 50.h,
                      width: 56.h,
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.greenPrimary,
                      ),
                      child: SvgPicture.asset(Assets.icons.filter),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                //===================ITEMS GRID=========================//
                Obx(() {
                  if (controller.isTopFlavoursLoading.value) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: Center(child: CircularProgressIndicator())
                    );
                  }
                  if (controller.topFlavours.isEmpty) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height*0.7,
                        child: Center(child: Text("No Top Flavours Yet!"))
                    );
                  }
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: controller.topFlavours.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      mainAxisExtent: 280.h,
                    ),
                    itemBuilder: (context, index) {
                      ProductModel model = controller.topFlavours[index];

                      return TopFlavourItem(
                        imageUrl: model.imageUrl,
                        isFavourite: model.isFavourite,
                        title: model.name,
                        weightInfo: model.weight,
                        currentPrice: model.price,
                        originalPrice: model.discountedPrice ?? model.price,
                        onFavoriteTap: (isFavourite){
                          if( model.isFavourite ){
                            productController.removeItemFromWishList( index: index);
                          }else{
                            productController.addItemToWishList(id: model.id);
                          }
                        },
                        onItemTap: () {
                          Get.toNamed(AppRoutes.topFlavoursDetailsScreen, arguments: model);
                        },
                        onAddTap: (){
                          cartController.addItemToCart(id: model.id);
                        },
                      );
                    },
                  );
                }),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
