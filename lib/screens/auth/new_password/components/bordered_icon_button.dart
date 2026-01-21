import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors/app_colors.dart';

class BorderedIconButton extends StatelessWidget {

  final String iconName;
  final VoidCallback onClick;

  const BorderedIconButton({super.key, required this.iconName, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: AppColors.greyB8,
                width: 1.r
            )
        ),
        child: SvgPicture.asset(
          iconName,
          height: 20.h,
          width: 20.w,
        ),
      ),
    );
  }
}
