import 'package:el_afrik_restaurant/core/api_response.dart';
import 'package:el_afrik_restaurant/core/api_service.dart';
import 'package:el_afrik_restaurant/core/show_snackbar.dart';
import 'package:el_afrik_restaurant/utils/api_endpoints/api_endpoints.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/cart/cart_item/cart_item_model.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }

  final ApiService apiService = Get.find<ApiService>();

  RxBool isLoading = false.obs;
  RxBool isAdding = false.obs;
  RxBool isIncreasing = false.obs;
  RxBool isDecreasing = false.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  RxDouble totalPrice = 0.0.obs;

  //GET CART ITEMS AND PRICING
  getCartItems() async {
    if (isLoading.value) {
      return;
    }

    isLoading.value = true;

    ApiResponse response = await apiService.networkRequest(
      method: "GET",
      isAuthRequired: true,
      endPoint: ApiEndpoints.getCartItems,
    );

    if (response.statusCode == 200) {
      final tempItems = response.data['data']['items'] as List<dynamic>?;

      if( tempItems is List && tempItems.isNotEmpty ){
        cartItems.value = tempItems.map<CartItemModel>((e) {
          return CartItemModel.fromJson(e);
        }).toList();
        totalPrice.value = response.data['data']['subtotal'];
      }

    }
    isLoading.value = false;
  }

  //ADD ITEM TO CART
  addItemToCart({required String id}) async{
    if( isAdding.value ){
      return;
    }
    isAdding.value = true;
    Map<String, dynamic> body = {
      "productId": id,
      "quantity": 1
    };

    ApiResponse response = await apiService.networkRequest(
      method: "POST",
      isAuthRequired: true,
      endPoint: ApiEndpoints.addItemToCart,
      body: body
    );
    if( response.statusCode == 201 ){
      getCartItems();
      showSnackBar(title: "Added to cart!", message: "Item added to cart.", backgroundColor: AppColors.greenPrimary);
    }
    isAdding.value = false;
  }

  //INCREASE DECREASE CART ITEMS
  increaseDecreaseCartItems({
    required String id,
    required int quantity,
    required int index,
    required bool isIncrease,
    required CartItemModel model
  }) async {
    if (isIncreasing.value || isDecreasing.value) {
      return;
    }
    isIncrease ? isIncreasing.value = true : isDecreasing.value = true;
    model.isUpdating.value = true;
    Map<String, dynamic> body = {"quantity": quantity};

    ApiResponse response = await apiService.networkRequest(
      method: "PATCH",
      isAuthRequired: true,
      endPoint: ApiEndpoints.updateCartItems(productId: id),
      body: body,
    );

    if (response.statusCode == 200) {
      totalPrice.value = response.data['data']['subtotal'];
      final items = response.data['data']['items'] as List<dynamic>?;
      if (items is List && items.isNotEmpty) {
        double itemPrice = items[index]['total'];
        int qnty = items[index]['quantity'];
        cartItems[index] = cartItems[index].copyWith(quantity: qnty);
        cartItems[index] = cartItems[index].copyWith(price: itemPrice);
      }
    }
    isIncrease ? isIncreasing.value = false : isDecreasing.value = false;
    model.isUpdating.value = false;
  }

  //REMOVE SINGLE ITEM FROM CART
  removeItemFromCart({required String id, required int index}) async {
    CartItemModel removedItem = cartItems[index];
    cartItems.removeAt(index);
    totalPrice.value -= removedItem.price;
    bool wasUndone = false;

    Get.snackbar(
        "Item Removed",
        "${removedItem.name} removed from cart.",
      mainButton: TextButton(
        onPressed: () {
          wasUndone = true;
          cartItems.insert(index, removedItem);
          totalPrice.value += removedItem.price;
          if (Get.isSnackbarOpen) Get.back();
        },
        child: Text("UNDO"),
      ),
      snackbarStatus: (status){
          if( status == SnackbarStatus.CLOSED && !wasUndone ){
            _removeItemFromServer(id: id);
          }
      }
    );
  }

  //REMOVE ITEM FROM SERVER IF UNDO DID NOT PRESSED
  _removeItemFromServer({required String id}) async{
    await apiService.networkRequest(
      method: "DELETE",
      isAuthRequired: true,
      endPoint: ApiEndpoints.removeItemFromCart(id: id),
    );
  }

  //CLEAR CART
  clearCart() async {
    ApiResponse response = await apiService.networkRequest(
      method: "DELETE",
      isAuthRequired: true,
      endPoint: ApiEndpoints.clearCart,
    );

    if (response.statusCode == 200) {
      cartItems.clear();
      totalPrice.value = 0.0;
    }
  }
}
