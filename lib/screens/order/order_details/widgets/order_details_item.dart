import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsItem extends StatelessWidget {

  final String imageUrl;
  final String name;
  final String quantity;
  final String price;
  final String point;

  const OrderDetailsItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.price,
    required this.point
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.only(right: 10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteF5,
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r,), bottomLeft: Radius.circular(12.r)),
            child: Image.asset( imageUrl,
            fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: name,
                fontColor: AppColors.grey72,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(text: "Quantity: $quantity",
                  fontColor: AppColors.greyB8,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: "\$$price",
                      fontColor: AppColors.grey72,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(text: "$point point",
                      fontColor: AppColors.greenPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
