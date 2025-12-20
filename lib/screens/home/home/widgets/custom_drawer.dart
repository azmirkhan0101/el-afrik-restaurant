import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            color: AppColors.greenShade, // Light greenish background
            child: Center(
              child: Image.asset(Assets.images.logo.keyName,
              height: 81.h,
                width: 144.w,
                fit: BoxFit.cover,
              ),
            )
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.favorite_border, 'Wish List'),
                _buildDrawerItem(Icons.history, 'History'),
                _buildDrawerItem(Icons.settings_outlined, 'Settings'),
                _buildDrawerItem(Icons.card_giftcard, 'Reward'),
                _buildDrawerItem(Icons.groups_outlined, 'Promotion & Events'),
                _buildDrawerItem(Icons.percent, 'Special Promos'),
                _buildDrawerItem(Icons.restaurant, 'Catering Reservation'),
                _buildDrawerItem(Icons.cake_outlined, 'Birthday Reward'),
                _buildDrawerItem(Icons.layers_outlined, 'Privacy Policy'),
                _buildDrawerItem(Icons.description_outlined, 'Terms & Conditions'),
              ],
            ),
          ),

          // Log Out Button Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add logout logic
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00B74A), // Green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black87),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          onTap: () {

          },
        ),
        const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16),
      ],
    );
  }
}