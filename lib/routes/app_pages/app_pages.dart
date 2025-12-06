import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/onboarding/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {

  AppPages._();

  static final pages = [
    GetPage(
  name: AppRoutes.splashScreen,
  page: (){
    return SplashScreen();
  })
  ];
}