import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/assets_gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onNotificationPressed;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.onMenuPressed,
    this.onNotificationPressed,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: Image.asset(
        Assets.images.logo.keyName,
        height: 61.h,
        width: 109.w,
      ),
      centerTitle: centerTitle,
      leading: IconButton(
        icon: Icon(Icons.menu, color: AppColors.greenPrimary),
        onPressed: onMenuPressed ?? () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: AppColors.greenPrimary),
          onPressed: onNotificationPressed ?? () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
