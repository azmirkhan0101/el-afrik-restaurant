import 'package:el_afrik_restaurant/widgets/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryItemWidget extends StatelessWidget {
  final int totalProducts;
  final double deliveryFee;
  final double price;
  final String date;
  final String driverName;
  final String driverPhone;
  final String driverImageUrl;
  final VoidCallback onViewClick;

  const HistoryItemWidget({
    super.key,
    required this.totalProducts,
    required this.deliveryFee,
    required this.price,
    required this.date,
    required this.driverName,
    required this.driverPhone,
    required this.driverImageUrl,
    required this.onViewClick
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
          BoxShadow(
          color: Color(0x5A6CEA12),
      spreadRadius: 1,
      blurRadius: 10,)
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Total Products: $totalProducts',
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Text(
            'Price: \$${price.toInt()}',
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Text(
            'Delivery Fee : \$${deliveryFee.toInt()}',
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Text(
            'Date: $date',
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const SizedBox(height: 20),

          // Driver Info Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F3E8), // Light green background
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(driverImageUrl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            driverName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            driverPhone,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h,),
                ButtonWidget(label: "View",
                  onPressed: onViewClick,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}