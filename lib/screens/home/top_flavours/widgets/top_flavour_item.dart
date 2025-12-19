import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../../utils/assets_gen/assets.gen.dart";

class TopFlavourItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String weightInfo;
  final double currentPrice;
  final double originalPrice;
  final VoidCallback? onAddTap;
  final VoidCallback? onFavoriteTap;

  const TopFlavourItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.weightInfo,
    required this.currentPrice,
    required this.originalPrice,
    this.onAddTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.h, // Fixed width for the card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Image Section with Favorite Button
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: buildImage( imageUrl )
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    radius: 18,
                    child: const Icon(Icons.favorite_border, color: Colors.lightGreen, size: 20),
                  ),
                ),
              ),
            ],
          ),

          // 2. Details Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  weightInfo,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                const SizedBox(height: 12),

                // 3. Pricing and Add Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$${currentPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "\$${originalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onAddTap,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.green, // The reddish-orange color
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String? imageUrl) {
    if (imageUrl == null ||
        imageUrl.isEmpty ||
        !imageUrl.startsWith('http')) {
      return Image.asset(
        Assets.dummy.topFlavourItem.keyName,
        height: 118.h,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      imageUrl,
      height: 118.h,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          Assets.dummy.topFlavourDummy.keyName,
          height: 118.h,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }
}