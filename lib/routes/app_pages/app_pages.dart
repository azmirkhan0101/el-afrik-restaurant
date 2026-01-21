import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/screens/auth/new_password/new_password_screen.dart';
import 'package:el_afrik_restaurant/screens/auth/otp_verify/otp_verify_screen.dart';
import 'package:el_afrik_restaurant/screens/auth/verify_account/verify_account_screen.dart';
import 'package:el_afrik_restaurant/screens/cart/checkout/checkout_screen.dart';
import 'package:el_afrik_restaurant/screens/cart/completed/completed_screen.dart';
import 'package:el_afrik_restaurant/screens/cart/delivery/delivery_screen.dart';
import 'package:el_afrik_restaurant/screens/cart/edit_address/edit_address_screen.dart';
import 'package:el_afrik_restaurant/screens/cart/payment/payment_screen.dart';
import 'package:el_afrik_restaurant/screens/cart/payment_success/payment_success_screen.dart';
import 'package:el_afrik_restaurant/screens/cart/pickup/pickup_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/catering/catering_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/catering_submitted/catering_submitted_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/change_password/change_password_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/history/history_details/history_details_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/history/order_history/order_history_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/loyalty/loyalty/loyalty_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/loyalty/points_history/points_history_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/privacy_policy/privacy_policy_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/reward/rewards_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/settings/settings_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/terms_conditions/terms_conditions_screen.dart';
import 'package:el_afrik_restaurant/screens/drawer/wishlist/wishlist_screen.dart';
import 'package:el_afrik_restaurant/screens/home/categories/categories_screen.dart';
import 'package:el_afrik_restaurant/screens/home/category_products/category_products_screen.dart';
import 'package:el_afrik_restaurant/screens/home/notification/notification_screen.dart';
import 'package:el_afrik_restaurant/screens/home/top_flavours_details/top_flavours_details_screen.dart';
import 'package:el_afrik_restaurant/screens/home/top_flavours/top_flavours_screen.dart';
import 'package:el_afrik_restaurant/screens/main_nav/main_nav_screen.dart';
import 'package:el_afrik_restaurant/screens/onboarding/onboarding_screen/onboarding_screen.dart';
import 'package:el_afrik_restaurant/screens/order/order_completed/order_completed_screen.dart';
import 'package:el_afrik_restaurant/screens/order/order_details/order_details_screen.dart';
import 'package:el_afrik_restaurant/screens/order/rate_us/rate_us_screen.dart';
import 'package:el_afrik_restaurant/screens/order/track_rider/track_rider_screen.dart';
import 'package:el_afrik_restaurant/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:el_afrik_restaurant/screens/promo_events/promo_details/promo_details_screen.dart';
import 'package:el_afrik_restaurant/screens/promo_events/special_promos/promo_events_screen.dart';
import 'package:el_afrik_restaurant/screens/states/no_internet/no_internet_screen.dart';
import 'package:el_afrik_restaurant/screens/states/no_reward/no_reward_screen.dart';
import 'package:el_afrik_restaurant/screens/states/out_of_stock/out_of_stock_screen.dart';
import 'package:get/get.dart';

import '../../screens/auth/auth_selection/auth_selection_screen.dart';
import '../../screens/auth/forgot_password/forgot_password_screen.dart';
import '../../screens/auth/login/login_screen.dart';
import '../../screens/auth/signup/signup_screen.dart';
import '../../screens/drawer/birthday/birthday_screen.dart';
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
        name: AppRoutes.verifyAccountScreen,
        page: (){
          return VerifyAccountScreen();
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
        }),
    GetPage(
        name: AppRoutes.topFlavoursScreen,
        page: (){
          return TopFlavoursScreen();
        }),
    GetPage(
        name: AppRoutes.categoriesScreen,
        page: (){
          return CategoriesScreen();
        }),
    GetPage(
        name: AppRoutes.categoryProductsScreen,
        page: (){
          return CategoryProductsScreen();
        }),
    GetPage(
        name: AppRoutes.topFlavoursDetailsScreen,
        page: (){
          return TopFlavoursDetailsScreen();
        }),
    GetPage(
        name: AppRoutes.orderDetailsScreen,
        page: (){
          return OrderDetailsScreen();
        }),
    GetPage(
        name: AppRoutes.trackRiderScreen,
        page: (){
          return TrackRiderScreen();
        }),
    GetPage(
        name: AppRoutes.rateUsScreen,
        page: (){
          return RateUsScreen();
        }),
    GetPage(
        name: AppRoutes.promoEventsScreen,
        page: (){
          return SpecialPromosScreen();
        }),
    GetPage(
        name: AppRoutes.promosDetailsScreen,
        page: (){
          return PromoDetailsScreen();
        }),
    GetPage(
        name: AppRoutes.privacyPolicyScreen,
        page: (){
          return PrivacyPolicyScreen();
        }),
    GetPage(
        name: AppRoutes.termsConditionsScreen,
        page: (){
          return TermsConditionsScreen();
        }),
    GetPage(
        name: AppRoutes.editProfileScreen,
        page: (){
          return EditProfileScreen();
        }),
    GetPage(
        name: AppRoutes.pickupScreen,
        page: (){
          return PickupScreen();
        }),
    GetPage(
        name: AppRoutes.wishListScreen,
        page: (){
          return WishlistScreen();
        }),
    GetPage(
        name: AppRoutes.orderHistoryScreen,
        page: (){
          return OrderHistoryScreen();
        }),
    GetPage(
        name: AppRoutes.historyDetailsScreen,
        page: (){
          return HistoryDetailsScreen();
        }),
    GetPage(
        name: AppRoutes.notificationScreen,
        page: (){
          return NotificationScreen();
        }),
    GetPage(
        name: AppRoutes.rewardsScreen,
        page: (){
          return RewardsScreen();
        }),
    GetPage(
        name: AppRoutes.cateringScreen,
        page: (){
          return CateringScreen();
        }),
    GetPage(
        name: AppRoutes.loyaltyProgramScreen,
        page: (){
          return LoyaltyScreen();
        }),
    GetPage(
        name: AppRoutes.pointHistoryScreen,
        page: (){
          return PointsHistoryScreen();
        }),
    GetPage(
        name: AppRoutes.deliveryScreen,
        page: (){
          return DeliveryScreen();
        }),
    GetPage(
        name: AppRoutes.completedScreen,
        page: (){
          return CompletedScreen();
        }),
    GetPage(
        name: AppRoutes.checkOutScreen,
        page: (){
          return CheckoutScreen();
        }),
    GetPage(
        name: AppRoutes.editAddressScreen,
        page: (){
          return EditAddressScreen();
        }),
    GetPage(
        name: AppRoutes.paymentScreen,
        page: (){
          return PaymentScreen();
        }),
    GetPage(
        name: AppRoutes.paymentSuccessScreen,
        page: (){
          return PaymentSuccessScreen();
        })
  ];
}
