import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 15.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                    color:  AppColors.greenPrimary,
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
                Expanded(child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.notifications_outlined),
                  ),
                  title: TextWidget(text: "Welcome to El Afrik!", textAlignment: TextAlign.left, fontWeight: FontWeight.w700,),
                  subtitle: TextWidget(text: "1 day ago", textAlignment: TextAlign.left, fontColor: AppColors.grey72,),
                ))
              ],
            ),
            SizedBox(height: 15.h,),
            Row(
              children: [
                Container(
                  height: 15.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                      color:  AppColors.greenPrimary,
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
                Expanded(child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.notifications_outlined),
                  ),
                  title: TextWidget(text: "Welcome to El Afrik!", textAlignment: TextAlign.left, fontWeight: FontWeight.w700,),
                  subtitle: TextWidget(text: "1 day ago", textAlignment: TextAlign.left, fontColor: AppColors.grey72,),
                ))
              ],
            ),
            SizedBox(height: 15.h,),
            Row(
              children: [
                Container(
                  height: 15.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                      color:  AppColors.greenPrimary,
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
                Expanded(child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.notifications_outlined),
                  ),
                  title: TextWidget(text: "Welcome to El Afrik!", textAlignment: TextAlign.left, fontWeight: FontWeight.w700,),
                  subtitle: TextWidget(text: "1 day ago", textAlignment: TextAlign.left, fontColor: AppColors.grey72,),
                ))
              ],
            ),
            SizedBox(height: 15.h,),
          ],
        ),
        ),
      ),
    );
  }
}
