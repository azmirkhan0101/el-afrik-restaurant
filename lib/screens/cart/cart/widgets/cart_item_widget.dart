import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class CartItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool isIncreasing;
  final bool isDecreasing;

  const CartItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.isIncreasing,
    required this.isDecreasing
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x5A6CEA12),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          //Image Section
          SizedBox(
            height: 70.h,
            width: 70.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(color: Colors.white),
                ),
                errorWidget: (context, url, error) => Container(
                  child: Icon(
                    Icons.no_food_rounded,
                    size: 35.r,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
           SizedBox(width: 10.w),
          //Text Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontColor: Color(0xFF1A2433),
                ),
                const SizedBox(height: 8),
                TextWidget(
                  text: '\$${price.toStringAsFixed(2)}',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontColor: Color(0xFF00C569),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          //Counter Section
          Row(
            children: [
              _buildCounterButton(Icons.remove, const Color(0xFFE8F5E9), const Color(0xFF00C569), onDecrement, isUpdating: isDecreasing),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              _buildCounterButton(Icons.add, const Color(0xFF00C569), Colors.white, onIncrement, isUpdating: isIncreasing),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, Color bgColor, Color iconColor, VoidCallback onTap, {required bool isUpdating}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 45.w,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isUpdating ?
        Center(
          child: SizedBox(height: 18.h, width: 18.w,
              child: CircularProgressIndicator(color: iconColor, strokeWidth: 2,)),
        )
            : Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}