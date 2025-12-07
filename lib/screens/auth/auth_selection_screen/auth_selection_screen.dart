import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/assets_gen/assets.gen.dart';
import '../../../widgets/button_widget/button_widget.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80.h,),
            Image.asset( Assets.images.logo.keyName,
              height: 153.h,
              width: 272.w,
            ),
            SizedBox(height: 10.h,),
          ],
        ),
      ),
    );
  }
}
