import 'package:el_afrik_restaurant/controllers/cart/cart_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/cart/cart/widgets/cart_item_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/icon_button_widget/icon_button_widget.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/models/cart/cart_item/cart_item_model.dart';
import '../../../utils/assets_gen/assets.gen.dart';

class CartScreen extends StatelessWidget {

  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          AppStrings.cart.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: SizedBox.shrink(),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: AppColors.greenPrimary,
        onRefresh: () async {
          controller.getCartItems();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(child: CircularProgressIndicator(color: AppColors.greenPrimary,)),
                );
              } else if (controller.cartItems.length < 1) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.h,
                      children: [
                        Image.asset(
                          Assets.images.outOfStock.keyName,
                          height: 150.h,
                          width: 150.w,
                        ),
                        TextWidget(text: "No items found in cart!"),
                      ],
                    ),
                  ),
                );
              } else {
                return mainBody(context);
              }
            }),
          ),
        ),
      ),
    );
  }

  //MAIN BODY WITH CART ITEMS AND PRICING
  mainBody(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.8,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: AppStrings.cartDetails.tr,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
              //=============================ADD MORE===============================
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8.w,
                children: [
                  IconButtonWidget(
                    iconData: Icons.add,
                    iconSize: 22.r,
                    iconColor: AppColors.white,
                    text: AppStrings.addMore.tr,
                    backgroundColor: AppColors.greenPrimary,
                    textColor: AppColors.white,
                    textSize: 18,
                    onPressed: () {
                      Get.toNamed(AppRoutes.topFlavoursScreen);
                    },
                  ),
                  IconButtonWidget(
                    iconData: Icons.delete,
                    iconSize: 22.r,
                    iconColor: AppColors.white,
                    text: "Clear all",
                    backgroundColor: AppColors.orange,
                    textColor: AppColors.white,
                    textSize: 18,
                    onPressed: () {
                      clearCartAlert(context);
                    },
                  ),
                ],
              ),
              //=============================CLEAR CART=============================
            ],
          ),
          SizedBox(height: 15.h),
          //==============================CART LIST==============================
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              CartItemModel model = controller.cartItems[index];
              return Dismissible(
                // Use a unique key, like the item ID
                key: Key(model.id.toString()),
                direction: DismissDirection.endToStart, // Swipe right-to-left
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  controller.removeItemFromCart(index: index, id: model.id);
                },
                child: Obx((){
                  return CartItemWidget(
                    imageUrl: model.imageUrl,
                    title: model.name,
                    price: model.price,
                    quantity: model.quantity,
                    isIncreasing: model.isUpdating.value && controller.isIncreasing.value,
                    isDecreasing: model.isUpdating.value && controller.isDecreasing.value,
                    onIncrement: () {
                      controller.increaseDecreaseCartItems(
                        id: model.id,
                        quantity: model.quantity + 1,
                        index: index,
                        isIncrease: true,
                        model: model,
                      );
                    },
                    onDecrement: () {
                      if( model.quantity > 1 ){
                        controller.increaseDecreaseCartItems(
                          id: model.id,
                          quantity: model.quantity - 1,
                          index: index,
                          isIncrease: false,
                          model: model,
                        );
                      }
                    },
                  );
                }),
              );
            },
          ),
          Spacer(),
          SizedBox(height: 10.h),
          Divider(thickness: 2.h),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: AppStrings.total.tr,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                fontColor: AppColors.greenPrimary,
              ),
              Obx((){
                return TextWidget(
                  text: "\$${controller.totalPrice.value.toStringAsFixed(2)}",
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontColor: AppColors.greenPrimary,
                );
              })
            ],
          ),
          SizedBox(height: 20.h),
          ButtonWidget(
            label: AppStrings.placeMyOrder.tr,
            backgroundColor: AppColors.orange,
            buttonRadius: 12,
            onPressed: () {
              showDeliveryMethodSelectionAlert(context);
            },
          ),
          SizedBox(height:
          45.h),
        ],
      ),
    );
  }

  //DELIVERY METHOD DIALOG
  void showDeliveryMethodSelectionAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "Select Method",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          content: const Text(
            "Please select your preferred delivery method to proceed.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Orange Pick Up Button
                  Expanded(
                    child: _buildCustomButton(
                      text: "Delivery",
                      color: const Color(0xFFFFA726), // Orange
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.deliveryScreen);
                      },
                    ),
                  ),
                  // Green Pick Up Button
                  Expanded(
                    child: _buildCustomButton(
                      text: "Pick up",
                      color: const Color(0xFF00C853), // Green
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.pickupScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  //SHOW CLEAR CART ALERT
  clearCartAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "Clear cart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          content: const Text(
            "Are you sure you want to clear your cart?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Orange Pick Up Button
                  Expanded(
                    child: _buildCustomButton(
                      text: "Cancel",
                      color: const Color(0xFFFFA726), // Orange
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  // Green Pick Up Button
                  Expanded(
                    child: _buildCustomButton(
                      text: "Clear",
                      color: const Color(0xFF00C853), // Green
                      onPressed: () {
                        Get.back();
                        controller.clearCart();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCustomButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        // Creates the capsule shape
        padding: const EdgeInsets.symmetric(vertical: 8),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}
