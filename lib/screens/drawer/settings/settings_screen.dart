import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              showDeleteDialog( context );
            },
          )
        ],
      ),
    );
  }


  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Account"),
          content: Text(
            "Are you sure you want to delete your account? This action cannot be undone.",
          ),
          actions: [
            // Cancel Button
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                // This closes the dialog without doing anything
                Get.back();
              },
            ),
            // Delete Button (Destructive Action)
            TextButton(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                print("Account Deleted");
                // 2. Close the dialog
                //Navigator.of(context).pop();
                Get.back();

                // 3. Optional: Navigate to login screen
                // Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }
}
