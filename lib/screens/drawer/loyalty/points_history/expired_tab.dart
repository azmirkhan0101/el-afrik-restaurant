import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpiredTab extends StatelessWidget {
  const ExpiredTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: TextWidget(text: "Chicken burger", textAlignment: TextAlign.left, maxLines: 1, overflow: TextOverflow.ellipsis, fontSize: 15,),
          subtitle: TextWidget(text: "09:35 AM 16/11/2025", textAlignment: TextAlign.left, fontSize: 14, fontColor: AppColors.black55,),
          trailing: TextWidget(text: "-300 Points", fontColor: AppColors.red, fontSize: 12,),
        ),
        ListTile(
          title: TextWidget(text: "Chicken burger", textAlignment: TextAlign.left,maxLines: 1, overflow: TextOverflow.ellipsis, fontSize: 15,),
          subtitle: TextWidget(text: "09:35 AM 16/11/2025", textAlignment: TextAlign.left, fontSize: 14, fontColor: AppColors.black55,),
          trailing: TextWidget(text: "-300 Points", fontColor: AppColors.red, fontSize: 12,),
        ),
        ListTile(
          title: TextWidget(text: "Chicken burger", textAlignment: TextAlign.left,maxLines: 1, overflow: TextOverflow.ellipsis, fontSize: 15,),
          subtitle: TextWidget(text: "09:35 AM 16/11/2025", textAlignment: TextAlign.left, fontSize: 14, fontColor: AppColors.black55,),
          trailing: TextWidget(text: "-300 Points", fontColor: AppColors.red, fontSize: 12,),
        ),
        ListTile(
          title: TextWidget(text: "Chicken burger", textAlignment: TextAlign.left,maxLines: 1, overflow: TextOverflow.ellipsis, fontSize: 15,),
          subtitle: TextWidget(text: "09:35 AM 16/11/2025", textAlignment: TextAlign.left, fontSize: 14, fontColor: AppColors.black55,),
          trailing: TextWidget(text: "-300 Points", fontColor: AppColors.red, fontSize: 12,),
        )
      ],
    );
  }
}
