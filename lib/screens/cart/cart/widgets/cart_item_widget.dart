import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class CartItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String restaurantName;
  final double price;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.restaurantName,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
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
          // 1. Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              Assets.dummy.cartItem.keyName,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // 2. Text Details Section
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
                const SizedBox(height: 4),
                TextWidget(
                  text: title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontColor: Colors.grey,
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

          // 3. Counter Section
          Row(
            children: [
              _buildCounterButton(Icons.remove, const Color(0xFFE8F5E9), const Color(0xFF00C569), onDecrement),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              _buildCounterButton(Icons.add, const Color(0xFF00C569), Colors.white, onIncrement),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, Color bgColor, Color iconColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}