import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/assets_gen/assets.gen.dart';

class OrderItemWidget extends StatelessWidget {

  final String status;
  final Color statusColor;
  final Color backgroundColor;

  const OrderItemWidget({
    super.key,
    required this.status,
    required this.statusColor,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.orderDetailsScreen);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.r,
            color: AppColors.greyB8
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(Assets.dummy.order.keyName,
            fit: BoxFit.cover,
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextWidget(text: "Best Burger",
                        overflow: TextOverflow.ellipsis,
                        textAlignment: TextAlign.left,
                        fontWeight: FontWeight.w900,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: TextWidget(text: status, fontColor: statusColor, fontSize: 14,),
                      )
                    ],
                  ),
                  TextWidget(text: "Amount: \$34",
                    fontColor: AppColors.grey72,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextWidget(text: "Date: ",
                            fontSize: 14,
                            fontColor: AppColors.greenPrimary,
                          ),
                          SizedBox(width: 8.w,),
                          TextWidget(text: "25-12-2025",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      IconButton(onPressed: (){

                      }, icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
