import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/assets_gen/assets.gen.dart';

class TopFlavourCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;
  final String deliveryTime;
  final double rating;
  final int points;

  const TopFlavourCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.deliveryTime,
    required this.rating,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black,
      child: Container(
        width: 285.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE WITH FALLBACK
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: buildImage( imageUrl )
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE + PRICE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$${price.toStringAsFixed(1)}",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // SUBTITLE
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  // BOTTOM INFO (time, rating, points)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18, color: Colors.orange),
                          SizedBox(width: 4),
                          Text("40-50min", style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 18, color: Colors.amber),
                          SizedBox(width: 4),
                          Text("9.5", style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.loyaltyPoint,
                          height: 18.h,
                            width: 18.w,
                          ),SizedBox(width: 4),
                          Text("10 Point", style: TextStyle(fontSize: 12.sp)),
                        ],
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


  Widget buildImage(String? imageUrl) {
    if (imageUrl == null ||
        imageUrl.isEmpty ||
        !imageUrl.startsWith('http')) {
      return Image.asset(
        Assets.dummy.topFlavourItem.keyName,
        height: 140.h,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      imageUrl,
      height: 140.h,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          Assets.dummy.topFlavourItem.keyName,
          height: 140.h,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
