import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/auth/new_password/new_password_screen.dart';
import 'package:el_afrik_restaurant/screens/auth/otp_verify/otp_verify_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/catering_submitted/catering_submitted_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/change_password/change_password_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/settings/settings_screen.dart';
import 'package:el_afrik_restaurant/screens/main_nav/main_nav_screen.dart';
import 'package:el_afrik_restaurant/screens/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:el_afrik_restaurant/screens/order/order_completed/order_completed_screen.dart';
import 'package:el_afrik_restaurant/screens/states/no_internet/no_internet_screen.dart';
import 'package:el_afrik_restaurant/screens/states/no_menu/no_menu_screen.dart';
import 'package:el_afrik_restaurant/screens/states/no_reward/no_reward_screen.dart';
import 'package:el_afrik_restaurant/screens/states/out_of_stock/out_of_stock_screen.dart';
import 'package:el_afrik_restaurant/screens/vip/birthday/birthday_screen.dart';
import 'package:get/get.dart';

import '../../screens/auth/auth_selection/auth_selection_screen.dart';
import '../../screens/auth/forgot_password/forgot_password_screen.dart';
import '../../screens/auth/login/login_screen.dart';
import '../../screens/auth/signup/signup_screen.dart';
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
        }),
    GetPage(
        name: AppRoutes.loginScreen,
        page: (){
          return LoginScreen();
        }),
    GetPage(
        name: AppRoutes.forgotPasswordScreen,
        page: (){
          return ForgotPasswordScreen();
        }),
    GetPage(
        name: AppRoutes.otpVerifyScreen,
        page: (){
          return OtpVerifyScreen();
        }),
    GetPage(
        name: AppRoutes.newPasswordScreen,
        page: (){
          return NewPasswordScreen();
        }),
    GetPage(
        name: AppRoutes.signupScreen,
        page: (){
          return SignupScreen();
        }),
    GetPage(
        name: AppRoutes.mainNavScreen,
        page: (){
          return MainNavScreen();
        }),
    GetPage(
        name: AppRoutes.noRewardScreen,
        page: (){
          return NoRewardScreen();
        }),
    GetPage(
        name: AppRoutes.outOfStockScreen,
        page: (){
          return OutOfStockScreen();
        }),
    GetPage(
        name: AppRoutes.noMenuScreen,
        page: (){
          return NoMenuScreen();
        }),
    GetPage(
        name: AppRoutes.noInternetScreen,
        page: (){
          return NoInternetScreen();
        }),
    GetPage(
        name: AppRoutes.settingsScreen,
        page: (){
          return SettingsScreen();
        }),
    GetPage(
        name: AppRoutes.changePasswordScreen,
        page: (){
          return ChangePasswordScreen();
        }),
    GetPage(
        name: AppRoutes.birthdayScreen,
        page: (){
          return BirthdayScreen();
        }),
    GetPage(
        name: AppRoutes.cateringSubmittedScreen,
        page: (){
          return CateringSubmittedScreen();
        }),
    GetPage(
        name: AppRoutes.orderCompletedScreen,
        page: (){
          return OrderCompletedScreen();
        })
  ];
}
