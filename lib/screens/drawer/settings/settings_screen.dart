import 'package:el_afrik_restaurant/controllers/drawer/settings_controller.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_gen/assets.gen.dart';

class SettingsScreen extends StatelessWidget {

  final SettingsController controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: TextWidget(text: AppStrings.settings.tr,
        fontSize: 20,
          fontWeight: FontWeight.w700,
          fontColor: AppColors.black,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.lock_outline_rounded),
            title: TextWidget(
                text: AppStrings.changePassword.tr,
              textAlignment: TextAlign.left,
            ),
            onTap: (){
              Get.toNamed(AppRoutes.changePasswordScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete_outline_outlined),
            title: TextWidget(text: AppStrings.deleteAccount.tr,
              textAlignment: TextAlign.left,
            ),
            onTap: (){
              controller.showDeleteDialog();
            },
          )
        ],
      ),
    );
  }
}
