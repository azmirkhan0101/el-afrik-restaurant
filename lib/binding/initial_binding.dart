import 'package:el_afrik_restaurant/controllers/auth/new_password_controller.dart';
import 'package:el_afrik_restaurant/controllers/auth/otp_verify_controller.dart';
import 'package:el_afrik_restaurant/controllers/auth/sign_up_controller.dart';
import 'package:el_afrik_restaurant/controllers/auth/verify_account_controller.dart';
import 'package:el_afrik_restaurant/controllers/cart/cart_controller.dart';
import 'package:el_afrik_restaurant/controllers/drawer/catering_controller.dart';
import 'package:el_afrik_restaurant/controllers/drawer/settings_controller.dart';
import 'package:el_afrik_restaurant/controllers/home/home_controller.dart';
import 'package:el_afrik_restaurant/controllers/payment/payment_controller.dart';
import 'package:el_afrik_restaurant/controllers/product/product_controller.dart';
import 'package:el_afrik_restaurant/controllers/profile/profile_controller.dart';
import 'package:el_afrik_restaurant/controllers/main_nav/main_nav_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth/forgot_password_controller.dart';
import '../controllers/auth/login_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<LoginController>((){
      return LoginController();
    }, fenix: true);

    Get.lazyPut<ForgotPasswordController>((){
      return ForgotPasswordController();
    }, fenix: true);

    Get.lazyPut<VerifyAccountController>((){
      return VerifyAccountController();
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

    Get.lazyPut<NewPasswordController>((){
      return NewPasswordController();
    }, fenix: true);

    Get.lazyPut<MainNavController>((){
      return MainNavController();
    }, fenix: true);

    Get.lazyPut<HomeController>((){
      return HomeController();
    }, fenix: true);

    Get.lazyPut<CartController>((){
      return CartController();
    }, fenix: true);


    Get.lazyPut<ProductController>((){
      return ProductController();
    }, fenix: true);

    Get.lazyPut<ProfileController>((){
      return ProfileController();
    }, fenix: true);

    Get.lazyPut<SettingsController>((){
      return SettingsController();
    }, fenix: true);

    Get.lazyPut<ProductController>((){
      return ProductController();
    }, fenix: true);

    Get.lazyPut<CateringController>((){
      return CateringController();
    }, fenix: true);

    Get.lazyPut<PaymentController>((){
      return PaymentController();
    }, fenix: true);

  }

}