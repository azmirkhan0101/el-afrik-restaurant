
import 'package:flutter_screenutil/flutter_screenutil.dart';

double letterSpacingFromFigma(double figmaPercent, double fontSize) {
  return (figmaPercent / 100) * fontSize.sp;
}