import 'package:el_afrik_restaurant/binding/initial_binding.dart';
import 'package:el_afrik_restaurant/routes/app_pages/app_pages.dart';
import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/assets_gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 925),
        minTextAdapt: true,
        //splitScreenMode: true,
        builder: (_ , child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: FontFamily.peridot,
            ),
            initialBinding: InitialBinding(),
            getPages: AppPages.pages,
            initialRoute: AppRoutes.welcomeScreen,
          );
        }
    );
  }
}


