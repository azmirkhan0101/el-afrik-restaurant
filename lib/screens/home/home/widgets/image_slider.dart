import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class ImageSlider extends StatelessWidget {

  ImageSlider({super.key});

  final CarouselSliderController _sliderController = CarouselSliderController();

  final List<String> imgList = [
    Assets.dummy.sliderItem.keyName,
    Assets.dummy.sliderItem.keyName,
    Assets.dummy.sliderItem.keyName,
    Assets.dummy.sliderItem.keyName,
  ];

  var currentIndex = 0.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
  }


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        const SizedBox(height: 20),
        CarouselSlider(
          carouselController: _sliderController,
          options: CarouselOptions(
            height: 150.h,
            aspectRatio: 9/16,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              updateIndex(index); // Update GetX state
            },
          ),
          items: imgList.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(url, fit: BoxFit.scaleDown, width: double.infinity),
            );
          }).toList(),
        ),

        const SizedBox(height: 10),

        // Obx only wraps the part that needs to change
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _sliderController.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: currentIndex.value == entry.key ? 25.0 : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: currentIndex.value == entry.key
                      ? Colors.blueAccent
                      : Colors.grey.shade400,
                ),
              ),
            );
          }).toList(),
        )),
      ],
    );
  }
}
