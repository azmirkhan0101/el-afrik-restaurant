import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey app background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              // 1. Background Image (The PNG from your assets)
              Image.asset(
                Assets.images.paymentSuccessGraphics.keyName, // Ensure path matches pubspec.yaml
                fit: BoxFit.contain,
              ),

              Positioned(
                top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Image.asset(Assets.images.successConfetti.keyName),
                  )),

              // 2. Content Overlay
              Positioned.fill(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Shield Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.verified_user_outlined,
                          color: Colors.white, size: 40),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Transaction Successful",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    const Text(
                      "Thank you for your purchase",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    const Text("Total Pay", style: TextStyle(color: Colors.grey)),
                    const Text(
                      "\$200.00",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 18.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Image.asset(Assets.images.dottedLines.keyName),
                    ),
                    // Spacer to push content to the bottom half
                    const Spacer(),

                    const Text("Total Top Up", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 10),
                    const Text(
                      "You earned 50 points",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //const SizedBox(height: 30),

                    // Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.offAndToNamed(AppRoutes.rewardsScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                              "View Reward",
                              style: TextStyle(color: Colors.white)
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.offAndToNamed(AppRoutes.mainNavScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00B341),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                              "Close",
                              style: TextStyle(color: Colors.white)
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}