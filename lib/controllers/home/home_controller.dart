import 'package:el_afrik_restaurant/controllers/product/product_controller.dart';
import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/api_service.dart';
import 'package:el_afrik_restaurant/data/models/home/category/category_model.dart';
import 'package:el_afrik_restaurant/utils/api_endpoints/api_endpoints.dart';
import 'package:get/get.dart';

import '../../data/models/product/product_model.dart';

class HomeController extends GetxController {

  ApiService apiService = Get.find<ApiService>();
  final ProductController controller = Get.find<ProductController>();

  //CATEGORIES
  RxBool isCategoryLoading = false.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  //CATEGORY PRODUCTS
  RxBool isCategoryProductsLoading = false.obs;
  RxList<ProductModel> categoryProducts = <ProductModel>[].obs;

  //TOP FLAVOURS
  RxBool isTopFlavoursLoading = false.obs;
  RxList<ProductModel> topFlavours = <ProductModel>[].obs;

  @override
  void onInit() {
    if (topFlavours.isEmpty) {
      getCategoryList();
      getTopFlavourProducts();
    }
    super.onInit();
  }

  //GET CATEGORY LIST
  getCategoryList() async {
    if (isCategoryLoading.value) {
      return;
    }

    isCategoryLoading.value = true;
    ApiResponse response = await apiService.networkRequest(
        method: "GET",
        isAuthRequired: true,
        endPoint: ApiEndpoints.getAllCategory
    );
    if( response.statusCode == 200 ){
      final tempList = response.data['data']['result'] as List<dynamic>?;
      if( tempList is List && tempList.isNotEmpty ){
        categories.value = tempList.map<CategoryModel>((e){
          return CategoryModel.fromJson(e);
        }).toList();
      }
    }
    isCategoryLoading.value = false;
  }

  //GET CATEGORY PRODUCTS
  getCategoryProducts({required String categoryId}) async {
    categoryProducts.assignAll([]);
    if (isCategoryProductsLoading.value) {
      return;
    }

    isCategoryProductsLoading.value = true;
    ApiResponse response = await apiService.networkRequest(
        method: "GET",
        isAuthRequired: true,
        endPoint: ApiEndpoints.getCategoryProducts(categoryId: categoryId)
    );
    if( response.statusCode == 200 ){
      final tempList = response.data['data']['result'] as List<dynamic>?;
      if( tempList is List && tempList.isNotEmpty ){
        categoryProducts.value = tempList.map<ProductModel>((e){
          return ProductModel.fromJson(e);
        }).toList();
      }
    }
    isCategoryProductsLoading.value = false;
  }

  //GET TOP FLAVOUR PRODUCTS
  getTopFlavourProducts() async {
    if (isTopFlavoursLoading.value) {
      return;
    }
    isTopFlavoursLoading.value = true;
    topFlavours.value = await controller.getTopFlavourProducts();
    isTopFlavoursLoading.value = false;
  }
}