import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:shimmer/shimmer.dart";

import "../../../../utils/app_colors/app_colors.dart";

class WishlistItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double weight;
  final double currentPrice;
  final double originalPrice;
  final VoidCallback? onAddTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onItemTap;

  WishlistItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.weight,
    required this.currentPrice,
    required this.originalPrice,
    this.onAddTap,
    this.onFavoriteTap,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        width: 210.h,
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
                  child: Container(
                      height: 110.h,
                      width: double.infinity,
                      color: AppColors.greenPrimary.withOpacity(0.65),
                      child: buildImage( imageUrl ))
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      radius: 18,
                      child: Icon(Icons.favorite_rounded, color: Colors.red, size: 20)
                    )
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
                      maxLines: 1,
                      style: TextStyle( fontSize: 16.sp, overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "± ${weight.toStringAsFixed(0)} gm",
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
      ),
    );
  }

  Widget buildImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(color: Colors.white),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.no_food_rounded,
          size: 70.r,
          color: Colors.white,
        ),
      ),
    );
  }
}