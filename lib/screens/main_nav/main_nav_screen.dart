import 'package:el_afrik_restaurant/screens/main_nav/controller/main_nav_controller.dart';
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
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Obx(() {
          if (controller.currentIndex.value != 1) {
            //NOT ORDER TAB
            return Image.asset(
              Assets.images.logo.keyName,
              height: 61.h,
              width: 109.w,
            );
          } else {
            return TextWidget(text: AppStrings.order.tr);
          }
        }),
        centerTitle: true,
        leading: Icon(Icons.menu, color: AppColors.greenPrimary),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: AppColors.greenPrimary),
          ),
        ],
      ),
      body: Obx((){
        return controller.screens[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(
          backgroundColor: AppColors.greenPrimary,
          elevation: 0,
          currentIndex: controller.currentIndex.value,
          showUnselectedLabels: true,
          fixedColor: Colors.white,
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
