import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/auth/auth_selection_screen/auth_selection_screen.dart';
import 'package:el_afrik_restaurant/screens/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';

import '../../screens/onboarding/welcome_screen/welcome_screen.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () {
        return WelcomeScreen();
      },
    ),
    GetPage(
        name: AppRoutes.onBoardingScreen,
        page: (){
          return OnboardingScreen();
        }),
    GetPage(
        name: AppRoutes.authSelectionScreen,
        page: (){
          return AuthSelectionScreen();
        })
  ];
}
