import 'package:el_afrik_restaurant/controllers/cart/cart_controller.dart';
import 'package:el_afrik_restaurant/controllers/home/home_controller.dart';
import 'package:el_afrik_restaurant/data/models/home/category/category_model.dart';
import 'package:el_afrik_restaurant/data/models/product/product_model.dart';
import 'package:el_afrik_restaurant/screens/home/top_flavours/widgets/top_flavour_item.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/no_menu/no_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/product/product_controller.dart';
import '../../../routes/app_routes/app_routes.dart';

class CategoryProductsScreen extends StatelessWidget {

  final HomeController controller = Get.find<HomeController>();
  final CartController cartController = Get.find<CartController>();
  final ProductController productController = Get.find<ProductController>();
  CategoryModel? categoryModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "El Afrik ${categoryModel?.categoryName ?? ""}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: AppColors.greenPrimary,
        onRefresh: () async {
          if (categoryModel?.id != null) {
            controller.getCategoryProducts(categoryId: categoryModel!.id);
          }
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Obx(() {
            if (controller.isCategoryProductsLoading.value) {
              return loadingBar(context);
            }
            if (controller.categoryProducts.isEmpty) {
              return NoMenu(
                onRetry: (){
                  if( categoryModel?.id != null ){
                    controller.getCategoryProducts(categoryId: categoryModel!.id);
                  }
                },
              );
            }
            return mainBody(context);
          }),
        ),
      ),
    );
  }

  //MAIN BODY
  mainBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 35.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.categoryProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          mainAxisExtent: 280.h,
        ),
        itemBuilder: (context, index) {
          final ProductModel model = controller.categoryProducts[index];

          return TopFlavourItem(
            imageUrl: model.imageUrl,
            isFavourite: model.isFavourite,
            title: model.name,
            weightInfo: model.weight,
            currentPrice: model.discountedPrice ?? model.price,
            originalPrice: model.price,
            onItemTap: () {
              Get.toNamed(AppRoutes.topFlavoursDetailsScreen, arguments: model);
            },
            onFavoriteTap: (isFavourite) {
              if( model.isFavourite ){
                productController.removeItemFromWishList( index: index);
              }else{
                productController.addItemToWishList(id: model.id);
              }
            },
            onAddTap: () {
            },
          );
        },
      ),
    );
  }

  //CIRCULAR LOADING
loadingBar(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.7,
        child: Center(
            child: CircularProgressIndicator(color: AppColors.greenPrimary,)
        )
    );
}
}
