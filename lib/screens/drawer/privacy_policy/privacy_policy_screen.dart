import 'package:el_afrik_restaurant/controllers/drawer/settings_controller.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/text_widget/text_widgets.dart';

class PrivacyPolicyScreen extends StatelessWidget {

  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.getPrivacyPolicy();
    });

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(text: AppStrings.privacyPolicy.tr,
        fontSize: 22,
        fontWeight: FontWeight.w900,
      ),
        centerTitle: true,
      ),
      body: Obx((){
        if( controller.isPrivacyPolicyLoading.value ){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          if( controller.privacyPolicy.value.isEmpty ){
            return Center( child: Text("No data found"),);
          }else{
            return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  child: Html(
                    data: controller.privacyPolicy.value,
                    style: {
                      "body": Style(
                        fontSize: FontSize(14),
                        lineHeight: LineHeight(1.6),
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      "h1": Style(fontSize: FontSize(22)),
                      "h2": Style(fontSize: FontSize(18)),
                    },
                  )
                )
            );
          }
        }
      })
    );
  }
}
