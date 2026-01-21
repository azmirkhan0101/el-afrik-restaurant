import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

// --- Controller ---
class RatingController extends GetxController {
  var selectedRating = 0.obs;

  void updateRating(int index) {
    selectedRating.value = index + 1;
  }
}

// --- Main Widget ---
class RateUsScreen extends StatelessWidget {
  RateUsScreen({super.key});

  final RatingController controller = Get.put(RatingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Image.asset(
          Assets.images.logo.keyName,
          height: 61.h,
          width: 109.w,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const SizedBox(height: 30),
             Text(
              "Tell us about your El Afrik experience",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Color(0xFF2D3E50)),
            ),
            const SizedBox(height: 20),
            _buildSelectableStars(),
            const SizedBox(height: 30),
            _buildShareButton(),
          ],
        ),
      ),
    );
  }

  // Top Section: Summary & Bar Chart
  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Average Rating
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("4.8", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
                  Icon(Icons.star, size: 28),
                ],
              ),
              Text("1,64,002 Ratings\n& 5,922 Reviews",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
        // Progress Bars
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildRatingBar("5", 0.85),
              _buildRatingBar("4", 0.50),
              _buildRatingBar("3", 0.65),
              _buildRatingBar("2", 0.15),
              _buildRatingBar("1", 0.05),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBar(String label, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text("$label ★", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                minHeight: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Interactive Star Selection
  Widget _buildSelectableStars() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => controller.updateRating(index),
          icon: Icon(
            index < controller.selectedRating.value ? Icons.star : Icons.star_border,
            color: Colors.orange,
            size: 36,
          ),
        );
      }),
    ));
  }

  // Submit Button
  Widget _buildShareButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ElevatedButton(
          onPressed: () => print("Rating: ${controller.selectedRating.value}"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00B74A), // Custom Green
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: const Text(
            "Share Review",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}