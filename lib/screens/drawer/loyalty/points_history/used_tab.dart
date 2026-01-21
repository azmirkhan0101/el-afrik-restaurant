import 'package:flutter/material.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class UsedTab extends StatelessWidget {
  const UsedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        chickenBurgerWidget(),
        chickenBurgerWidget(),
        chickenBurgerWidget(),
      ],
    );
  }

  Widget chickenBurgerWidget() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Profile/Food Image
           CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(Assets.dummy.cartItem.keyName),
            // Note: In a real app, you'd use a local asset or valid URL
          ),
          const SizedBox(width: 16),

          // 2. Middle Text Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  maxLines: 1,
                  'Chicken burger',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '\$24.00',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  '09:35 AM 16/11/2025',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Expires in 27 Dayes', // Matches the typo in your image
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFE57373), // Reddish/Orange tint
                  ),
                ),
              ],
            ),
          ),

          // 3. Right Side Points
          const Text(
            '-300 Points',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFFD8704A), // Deep orange/brown color
            ),
          ),
        ],
      ),
    );
  }
}
