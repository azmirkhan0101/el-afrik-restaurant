import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 60, bottom: 30),
            color: AppColors.greenShade,
            child: Center(
              child: Image.asset(
                Assets.images.logo.keyName,
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
                _buildDrawerItem(Icons.favorite_border, 'Wish List', (){
                  Get.back();
                  Get.toNamed(AppRoutes.wishListScreen);
                }),
                _buildDrawerItem(Icons.history, 'History', (){
                  Get.back();
                  Get.toNamed(AppRoutes.orderHistoryScreen);
                }),
                _buildDrawerItem(Icons.settings_outlined, 'Settings', (){
                  Get.back();
                  Get.toNamed(AppRoutes.settingsScreen);
                }),
                _buildDrawerItem(Icons.card_giftcard, 'Reward', (){
                  Get.back();
                  Get.toNamed(AppRoutes.rewardsScreen);
                }),
                _buildDrawerItem(Icons.workspace_premium_outlined, 'Loyalty Program', (){
                  Get.back();
                  Get.toNamed(AppRoutes.loyaltyProgramScreen);
                }),
                _buildDrawerItem(Icons.groups_outlined, 'Promotion & Events', (){
                  Get.back();
                  Get.toNamed(AppRoutes.promoEventsScreen);
                }),
                _buildDrawerItem(Icons.restaurant, 'Catering Reservation', (){
                  Get.back();
                  Get.toNamed(AppRoutes.cateringScreen);
                }),
                _buildDrawerItem(Icons.cake_outlined, 'Birthday Reward', (){
                  Get.back();
                  Get.toNamed(AppRoutes.birthdayScreen);
                }),
                _buildDrawerItem(Icons.question_mark_outlined, 'FAQ', (){
                  Get.back();
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                }),
                _buildDrawerItem(Icons.layers_outlined, 'Privacy Policy', (){
                  Get.back();
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                }),
                _buildDrawerItem(Icons.description_outlined, 'Terms & Conditions', (){
                  Get.back();
                  Get.toNamed(AppRoutes.termsConditionsScreen);
                }),
              ],
            ),
          ),

          // Log Out Button Section
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: (){
                  showLogoutDialog();
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


  //LOGOUT ALERT
  void showLogoutDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Image.asset(Assets.images.warning.keyName,),
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: const Text(
            "Are you sure you want to logout?",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          actions: [
            Row(
              children: [
                // Cancel button
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w), // Spacing between buttons

                // Delete button
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () async{
                        Navigator.of(context).pop();
                        await GetStorage().erase();
                        Get.offAllNamed( AppRoutes.onBoardingScreen );
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }


  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onPressed ) {
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
            onPressed();
          },
        ),
        const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16),
      ],
    );
  }
}