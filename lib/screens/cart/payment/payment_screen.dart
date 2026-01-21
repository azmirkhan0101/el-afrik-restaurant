import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back, color: Colors.black),),
        title: const Text("Payment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Credit Card Illustration
            _buildCreditCard(),
            const SizedBox(height: 30),

            // Input Fields
            _buildInputField("Name", "Raju"),
            const SizedBox(height: 20),
            _buildInputField("Card Number", "123456789"),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _buildInputField("Expired Date", "25/12/2024", icon: Icons.calendar_month)),
                const SizedBox(width: 20),
                Expanded(child: _buildInputField("CVV", "25/12/2024", icon: Icons.calendar_month)),
              ],
            ),

            const SizedBox(height: 40),

            // Total Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("\$771.00", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 40),

            // Payment Button
            ButtonWidget(
                label: AppStrings.payment,
              buttonRadius: 100,
              onPressed: (){
                Get.toNamed(AppRoutes.paymentSuccessScreen);
              },
            ),
            SizedBox(height: 40.h,)
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCard() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color(0xFF23395d), Color(0xFF16222A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("world", style: TextStyle(color: Colors.white70, fontSize: 18)),
              Icon(Icons.wifi, color: Colors.white70),
            ],
          ),
           Icon(Icons.sim_card, color: Colors.grey, size: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("5412 7512 3412 3456", style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 2)),
              Text("12/23", style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text("Lee M. Cardholder", style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
            ),
          ),
        ),
      ],
    );
  }
}