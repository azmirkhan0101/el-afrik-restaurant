import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_afrik_restaurant/controllers/profile/profile_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          AppStrings.profile.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        leading: SizedBox.shrink(),
        actions: [
          //==================EDIT ICON BUTTON=======================
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.editProfileScreen, );
            },
            icon: Icon(Icons.edit, color: AppColors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              //==========================PROFILE IMAGE======================
              Center(
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.r,
                      color: AppColors.greenPrimary,
                    ),
                  ),
                  child: Obx(() {
                    return ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: controller.profileModel.value?.image ?? "",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(color: Colors.white),
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(
                            Icons.person,
                            size: 70.r,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 15.h),
              //==================NAME========================
              Center(
                child: Obx((){
                  return TextWidget(
                    text: "${controller.profileModel.value?.firstName ?? ""} ${controller.profileModel.value?.lastName ?? ""}",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  );
                })
              ),
              SizedBox(height: 5.h),
              //==================ADDRESS========================
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Obx((){
                    return TextWidget(
                      text: controller.profileModel.value?.location ?? "",
                      fontColor: AppColors.black32,
                      fontSize: 18,
                    );
                  })
                ),
              ),
              SizedBox(height: 20.h),
              //===============POINTS=================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.loyaltyPoint,
                  height: 25.h,
                    width: 25.w,
                  ),
                  SizedBox( width: 6,
                  ),
                  Obx((){
                    return Text("${controller.profileModel.value?.point ?? 0} Point", style: TextStyle(fontWeight: FontWeight.w500));
                  })
                ],
              ),
              //=====================USER NAME==========================
              TextWidget(text: AppStrings.userName.tr),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Obx((){
                  return TextWidget(
                    textAlignment: TextAlign.left,
                    text: "${controller.profileModel.value?.firstName ?? ""} ${controller.profileModel.value?.lastName ?? ""}",
                    fontColor: AppColors.black32,
                  );
                })
              ),
              SizedBox(height: 20.h),
              //=====================EMAIL===========================
              TextWidget(text: AppStrings.email.tr),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Obx((){
                  return TextWidget(
                    textAlignment: TextAlign.left,
                    text: controller.profileModel.value?.email ?? "",
                    fontColor: AppColors.black32,
                  );
                })
              ),
              SizedBox(height: 20.h),
              //=====================CONTACT NUMBER===========================
              TextWidget(text: AppStrings.contactNo.tr),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Obx((){
                  return TextWidget(
                    textAlignment: TextAlign.left,
                    text: controller.profileModel.value?.contact ?? "",
                    fontColor: AppColors.black32,
                  );
                })
              ),
              SizedBox(height: 20.h),
              //=====================DATE OF BIRTH===========================
              TextWidget(text: AppStrings.dateOfBirth.tr),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Obx((){
                  return TextWidget(
                    textAlignment: TextAlign.left,
                    text: DateFormat( "dd MMM yyyy" ).format( controller.profileModel.value?.dob ?? DateTime.now()),
                    fontColor: AppColors.black32,
                  );
                })
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
