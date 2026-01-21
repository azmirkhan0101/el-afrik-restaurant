import 'package:el_afrik_restaurant/controllers/payment/payment_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:el_afrik_restaurant/widgets/loading_button/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';

class CheckoutScreen extends StatelessWidget {

  final PaymentController controller = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text(
          'Check out',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed( AppRoutes.editAddressScreen );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFD35433),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Edit Address', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const Text('Name: User Name', style: TextStyle(color: Colors.grey)),
            const Text('Contact Number: +99000000000', style: TextStyle(color: Colors.grey)),
            const Text('13th Street. 47 W 13th St, New York, NY 10011', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            // Payment Option Section
            const Text(
              'Payment Option',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Card', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Summary Totals
            _buildPriceRow('Sub Total:', '\$715.00'),
            const SizedBox(height: 10),
            _buildPriceRow('Delivery Fee:', '\$56.00'),
            const Divider(height: 30),
            _buildPriceRow('Total:', '\$771.00', isTotal: true),
            const Spacer(),
            //============================CHECKOUT=============================
            Obx((){
              return LoadingButton(
                text: AppStrings.checkOut.tr,
                width: double.infinity,
                buttonRadius: 100,
                isLoading: controller.isCheckoutLoading.value,
                onPressed: (){
                  controller.checkOut(deliveryMethod: "pickup");
                },
              );
            }),
             SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String price, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? const Color(0xFF5C5C9C) : Colors.black54,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? const Color(0xFF5C5C9C) : Colors.black54,
          ),
        ),
      ],
    );
  }
}