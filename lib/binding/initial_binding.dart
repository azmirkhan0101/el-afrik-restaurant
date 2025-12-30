import 'package:el_afrik_restaurant/controllers/auth/sign_up_controller.dart';
import 'package:el_afrik_restaurant/screens/auth/new_password/controller/new_password_controller.dart';
import 'package:el_afrik_restaurant/screens/auth/otp_verify/controller/otp_verify_controller.dart';
import 'package:el_afrik_restaurant/screens/drawer/change_password/controller/change_password_controller.dart';
import 'package:el_afrik_restaurant/screens/main_nav/controller/main_nav_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth/login_controller.dart';
import '../screens/auth/forgot_password/controller/forgot_password_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<LoginController>((){
      return LoginController();
    }, fenix: true);

    Get.lazyPut<ForgotPasswordController>((){
      return ForgotPasswordController();
    }, fenix: true);

    Get.lazyPut<OtpVerifyController>((){
      return OtpVerifyController();
    }, fenix: true);

    Get.lazyPut<NewPasswordController>((){
      return NewPasswordController();
    }, fenix: true);

    Get.lazyPut<SignUpController>((){
      return SignUpController();
    }, fenix: true);

    Get.lazyPut<ChangePasswordController>((){
      return ChangePasswordController();
    }, fenix: true);

    Get.lazyPut<MainNavController>((){
      return MainNavController();
    }, fenix: true);
  }

}