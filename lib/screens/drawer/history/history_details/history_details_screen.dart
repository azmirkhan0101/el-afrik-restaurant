import 'package:el_afrik_restaurant/screens/drawer/history/history_details/widgets/details_overview_widget.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/assets_gen/assets.gen.dart';
import '../../../../widgets/text_widget/text_widgets.dart';

class HistoryDetailsScreen extends StatelessWidget {
  const HistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(AppStrings.historyDetails.tr),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric( horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            DetailsOverviewWidget(),
            SizedBox( height: 20.h,),
            TextWidget(text: AppStrings.products.tr,
            fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(12)
              ),
              child: ListTile(
                leading: Image.asset(Assets.dummy.cartItem.keyName,
                height: 70.h,
                  width: 70.w,
                  fit: BoxFit.cover,
                ),
                title: TextWidget(text: "Pizza", fontWeight: FontWeight.w600, textAlignment: TextAlign.left,),
                subtitle: TextWidget(text: "500g/2pcs", fontColor: AppColors.grey72, textAlignment: TextAlign.left,),
                trailing: TextWidget(text: "\$25.00", fontColor: AppColors.orange,),
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: ListTile(
                leading: Image.asset(Assets.dummy.cartItem.keyName,
                  height: 70.h,
                  width: 70.w,
                  fit: BoxFit.cover,
                ),
                title: TextWidget(text: "Pizza", fontWeight: FontWeight.w600, textAlignment: TextAlign.left,),
                subtitle: TextWidget(text: "500g/2pcs", fontColor: AppColors.grey72, textAlignment: TextAlign.left,),
                trailing: TextWidget(text: "\$25.00", fontColor: AppColors.orange,),
              ),
            ),
            SizedBox(height: 8.h,),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: ListTile(
                leading: Image.asset(Assets.dummy.cartItem.keyName,
                  height: 70.h,
                  width: 70.w,
                  fit: BoxFit.cover,
                ),
                title: TextWidget(text: "Pizza", fontWeight: FontWeight.w600, textAlignment: TextAlign.left,),
                subtitle: TextWidget(text: "500g/2pcs", fontColor: AppColors.grey72, textAlignment: TextAlign.left,),
                trailing: TextWidget(text: "\$25.00", fontColor: AppColors.orange,),
              ),
            ),
            SizedBox(height: 25.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.subTotal.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(text: "\$55.00",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.deliveryCharge.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(text: "\$15.00",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.discount.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(text: "\$0.00",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            Divider(
              thickness: 2.h,
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: AppStrings.total.tr,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontColor: AppColors.greenPrimary,
                ),
                TextWidget(text: "\$70.00",
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontColor: AppColors.greenPrimary,
                )
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}
