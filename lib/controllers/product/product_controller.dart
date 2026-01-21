import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/data/models/product/product_model.dart';
import 'package:el_afrik_restaurant/data/models/promo/promo_events_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api_service.dart';
import '../../screens/drawer/wishlist/widgets/wishlist_item_widget.dart';
import '../../utils/api_endpoints/api_endpoints.dart';

class ProductController extends GetxController {
  //TODO: add pagination

  //1. Top Flavours
  //2. Promo Events
  //3. Rewards
  //4. Wishlist

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent * 0.9) {
        getAllPromotionEvents();
      }
    });
    super.onInit();
  }

  final ApiService apiService = Get.find<ApiService>();

  List<ProductModel> topFlavours = <ProductModel>[];
  RxList<ProductModel> promoEventProducts = <ProductModel>[].obs;

  //WISHLIST
  final GlobalKey<AnimatedGridState> wishListGridKey =
      GlobalKey<AnimatedGridState>();
  RxList<ProductModel> wishlistProducts = <ProductModel>[].obs;
  RxBool isPromotionEventsLoading = false.obs;
  RxBool isWishlistLoading = false.obs;

  ScrollController scrollController = ScrollController();

  //GET TOP FLAVOUR PRODUCTS
  Future<List<ProductModel>> getTopFlavourProducts() async {
    ApiResponse response = await apiService.networkRequest(
      method: "GET",
      isAuthRequired: true,
      endPoint: ApiEndpoints.topFlavourProduct,
    );

    if (response.statusCode == 200) {
      final tempProducts = response.data['data']['result'];
      topFlavours = tempProducts
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    }
    return topFlavours;
  }

  //GET PROMOTION EVENTS PRODUCTS
  getAllPromotionEvents() async {
    if (isPromotionEventsLoading.value) {
      return;
    }

    isPromotionEventsLoading.value = true;
    ApiResponse response = await apiService.networkRequest(
      method: "GET",
      isAuthRequired: false,
      endPoint: ApiEndpoints.getAllProducts,
    );
    isPromotionEventsLoading.value = false;

    if (response.statusCode == 200) {
      final tempProducts = response.data['data']['result'];
      promoEventProducts.value = tempProducts
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    }
  }

  //GET WISHLIST PRODUCTS
  Future<void> getWishlistProducts() async {
    if (isWishlistLoading.value) {
      return;
    }

    wishlistProducts.assignAll([]);

    isWishlistLoading.value = true;
    ApiResponse response = await apiService.networkRequest(
      method: "GET",
      isAuthRequired: true,
      endPoint: ApiEndpoints.getWishList,
    );

    isWishlistLoading.value = false;
    if (response.statusCode == 200) {
      if (response.data == null || response.data['data'] == null) {
        return;
      }
      final tempProducts = response.data['data']['products'] as List<dynamic>?;
      if (tempProducts is List && tempProducts.isNotEmpty) {
        wishlistProducts.value = tempProducts
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .toList();
      }
    }
  }

  //ADD ITEM TO WISHLIST
  addItemToWishList({required String id}) async {
    await apiService.networkRequest(
      method: 'POST',
      isAuthRequired: true,
      endPoint: ApiEndpoints.addItemToWishList(id: id),
      body: {},
    );
  }

  //REMOVE ITEM FROM WISHLIST
  removeItemFromWishList({required int index}) async {
    ProductModel model = wishlistProducts[index];
    String id = model.id;
    wishListGridKey.currentState?.removeItem(index, (context, animation) {
      return _buildItem(model, animation);
    }, duration: const Duration(milliseconds: 300));

    wishlistProducts.removeAt(index);
    await apiService.networkRequest(
      method: 'DELETE',
      isAuthRequired: true,
      endPoint: ApiEndpoints.removeItemFromWishlist(id: id),
    );
  }

  Widget _buildItem(ProductModel model, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: WishlistItemWidget(
        imageUrl: model.imageUrl,
        title: model.name,
        weight: model.weight,
        currentPrice: model.discountedPrice ?? model.price,
        originalPrice: model.price,
      ),
    );
  }
}
