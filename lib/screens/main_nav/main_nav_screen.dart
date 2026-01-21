import 'package:el_afrik_restaurant/controllers/main_nav/main_nav_controller.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/assets_gen/assets.gen.dart';

class MainNavScreen extends StatelessWidget {

  final MainNavController controller = Get.find<MainNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx((){
        return controller.screens[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.greenPrimary,
          elevation: 0,
          currentIndex: controller.currentIndex.value,
          showUnselectedLabels: true,
          fixedColor: Colors.white,
          unselectedItemColor: AppColors.white,
          unselectedLabelStyle: TextStyle(color: AppColors.white),
          onTap: (selectedIndex){
            if( selectedIndex != controller.currentIndex.value ){
              controller.currentIndex.value = selectedIndex;
            }
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.greenPrimary,
              icon: SvgPicture.asset(Assets.icons.home),
              activeIcon: SvgPicture.asset(Assets.icons.homeSelected),
              label: AppStrings.home.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.order),
              activeIcon: SvgPicture.asset(Assets.icons.orderSelected),
              label: AppStrings.order.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.qrCode),
              activeIcon: SvgPicture.asset(Assets.icons.qrSelected),
              label: AppStrings.qrSc.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.cart),
              activeIcon: SvgPicture.asset(Assets.icons.cartSelected),
              label: AppStrings.cart.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.icons.profile),
              activeIcon: SvgPicture.asset(Assets.icons.profileSelected),
              label: AppStrings.profile.tr,
            ),
          ],
        );
      })
    );
  }
}
