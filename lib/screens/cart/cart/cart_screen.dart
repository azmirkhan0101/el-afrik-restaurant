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
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<CartItemModel> cartItems = [
      CartItemModel(
        id: '1',
        title: 'Chicken Burger',
        restaurantName: 'Burger Factory LTD',
        imageUrl: Assets.dummy.cartItem.keyName,
        price: 22.00,
        quantity: 1,
      ),
      CartItemModel(
        id: '2',
        title: 'Double Beef Burger',
        restaurantName: 'Meat & Greet',
        imageUrl: Assets.dummy.cartItem.keyName,
        price: 28.50,
        quantity: 2,
      ),
      CartItemModel(
        id: '3',
        title: 'Spicy Zinger',
        restaurantName: 'Crispy Corner',
        imageUrl: Assets.dummy.cartItem.keyName,
        price: 18.00,
        quantity: 1,
      ),
      CartItemModel(
        id: '4',
        title: 'Veggie Deluxe',
        restaurantName: 'The Green Leaf',
        imageUrl: Assets.dummy.cartItem.keyName,
        price: 15.00,
        quantity: 3,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(AppStrings.cart.tr),
        centerTitle: true,
        leading: SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.cartDetails.tr,
                fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                IconButtonWidget(
                    iconData: Icons.add,
                    iconSize: 22.r,
                    iconColor: AppColors.white,
                    text: AppStrings.addMore.tr,
                    backgroundColor: AppColors.orange,
                    textColor: AppColors.white,
                    textSize: 18
                )
              ],
            ),
            SizedBox( height: 15.h,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
                itemBuilder: (context, index){

                CartItemModel model = cartItems[index];

                return CartItemWidget(
                    imageUrl: model.imageUrl,
                    title: model.title,
                    restaurantName: model.restaurantName,
                    price: model.price,
                    quantity: model.quantity,
                    onIncrement: (){

                    },
                    onDecrement: (){

                    }
                );
                }
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.subTotal.tr,
                fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(text: "\$55.00",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.deliveryCharge.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(text: "\$15.00",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.discount.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(text: "\$0.00",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            Divider(
              thickness: 2.h,
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.total.tr,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontColor: AppColors.greenPrimary,
                ),
                TextWidget(text: "\$70.00",
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontColor: AppColors.greenPrimary,
                )
              ],
            ),
            SizedBox( height: 20.h),
            ButtonWidget(label: AppStrings.placeMyOrder.tr,
            backgroundColor: AppColors.orange,
              buttonRadius: 12,
              onPressed: (){
              showDeliveryMethodSelectionAlert(context);
              },
            )
          ],
        ),
        ),
      )
    );
  }

  void showDeliveryMethodSelectionAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Select Method"),
          content: const Text("Please select your preferred delivery method to proceed."),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Orange Pick Up Button
                  _buildCustomButton(
                    text: "Delivery",
                    color: const Color(0xFFFFA726), // Orange
                    onPressed: (){
                      Get.back();
                      Get.toNamed(AppRoutes.deliveryScreen);
                    },
                  ),
                  // Green Pick Up Button
                  _buildCustomButton(
                    text: "Pick up",
                    color: const Color(0xFF00C853), // Green
                    onPressed: (){
                      Get.back();
                      Get.toNamed(AppRoutes.pickupScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCustomButton({required String text, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(), // Creates the capsule shape
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}


