import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/auth/new_password/new_password_screen.dart';
import 'package:el_afrik_restaurant/screens/auth/otp_verify/otp_verify_screen.dart';
import 'package:el_afrik_restaurant/screens/onboarding/onboarding_screen/onboarding_screen.dart';
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
        })
  ];
}
