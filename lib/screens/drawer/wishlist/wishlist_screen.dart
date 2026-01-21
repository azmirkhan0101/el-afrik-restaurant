import 'package:el_afrik_restaurant/controllers/cart/cart_controller.dart';
import 'package:el_afrik_restaurant/controllers/product/product_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/drawer/wishlist/widgets/wishlist_item_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/no_menu/no_menu.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/models/product/product_model.dart';

class WishlistScreen extends StatelessWidget {

  final ProductController controller = Get.find<ProductController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {

    controller.getWishlistProducts();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(AppStrings.wishList.tr, style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: AppColors.greenPrimary,
        onRefresh: () async{
         controller.getWishlistProducts();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              //===================ITEMS GRID=========================
              Obx((){
                if( controller.isWishlistLoading.value ){
                  return loadingBar(context);
                }
                if( controller.wishlistProducts.isEmpty ) {
                  return NoMenu(
                    onRetry: (){
                      controller.getWishlistProducts();
                    },
                  );
                }
                return mainBody(context);
              }),
              SizedBox( height: 30.h,)
            ],
          ),
          ),
        ),
      ),
    );
  }

  //MAIN BODY
mainBody(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: AnimatedGrid(
        key: controller.wishListGridKey,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        initialItemCount: controller.wishlistProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          mainAxisExtent: 260.h,
        ),
        itemBuilder: (context, index, animation) {

          final ProductModel model = controller.wishlistProducts[index];

          return ScaleTransition(
            scale: animation,
            child: WishlistItemWidget(
              imageUrl: model.imageUrl,
              title: model.name,
              weight: model.weight,
              currentPrice: model.price,
              originalPrice: model.discountedPrice ?? model.price,
              onItemTap: (){
                Get.toNamed(AppRoutes.topFlavoursDetailsScreen, arguments: model);
              },
              onFavoriteTap: (){
                controller.removeItemFromWishList(index: index);
              },
              onAddTap: (){
                cartController.addItemToCart(id: model.id);
              },
            ),
          );
        },
      ),
    );
}

//LOADING
loadingBar(BuildContext context){
  return SizedBox(
      height: MediaQuery.of(context).size.height*0.7,
      child: Center(child: CircularProgressIndicator(color: AppColors.greenPrimary,)));
}
}
