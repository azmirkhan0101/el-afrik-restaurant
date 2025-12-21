import 'package:flutter/material.dart';

class HistoryItemWidget extends StatelessWidget {
  final int totalProducts;
  final double deliveryFee;
  final double price;
  final String date;
  final String driverName;
  final String driverPhone;
  final String driverImageUrl;

  const HistoryItemWidget({
    super.key,
    required this.totalProducts,
    required this.deliveryFee,
    required this.price,
    required this.date,
    required this.driverName,
    required this.driverPhone,
    required this.driverImageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Fixed width for demonstration
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
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
          Row(
            children: [
              Text(
                'Delivery Fee : \$${deliveryFee.toInt()}',
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(width: 30),
              Text(
                'Price: \$${price.toInt()}',
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
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
            child: Row(
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
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B041),
                    // Green button
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Complete', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}