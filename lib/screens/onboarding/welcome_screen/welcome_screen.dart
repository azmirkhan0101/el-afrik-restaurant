import 'dart:async';

import 'package:el_afrik_restaurant/routes/app_routes/app_routes.dart';
import 'package:el_afrik_restaurant/utils/app_colors/app_colors.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:el_afrik_restaurant/widgets/custom_asset_image/custom_asset_image.dart';
import 'package:el_afrik_restaurant/widgets/text_widget/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/app_constants/app_constants.dart';
import '../../../utils/assets_gen/assets.gen.dart';

enum AuthStatus {
  loggedInAndVerified,
  loggedInNotVerified,
  loggedOut,
}


class WelcomeScreen extends StatelessWidget {

  final storage = GetStorage();

  Future<AuthStatus> checkAuthStatus() async {

    await Future.delayed(const Duration(milliseconds: 2500));

    // Read the token and verification status
    final String? token = storage.read( accessTokenKey );

    final bool verificationRequired = storage.read( requireVerificationKey ) ?? false;

    // If token is null or empty, the user is logged out (or never logged in)
    if ( token == null || token.isEmpty ) {//NO TOKEN -> LOGGED OUT
      if( verificationRequired ){
        return AuthStatus.loggedInNotVerified;
      }else{
        return AuthStatus.loggedOut;
      }
    }else{//TOKEN FOUND -> LOGGED IN
      return AuthStatus.loggedInAndVerified;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      body: FutureBuilder<AuthStatus>(
          future: checkAuthStatus(),
          builder: (context, snapshot){
            if( !snapshot.hasData ){
              return splashStack();
            }

            WidgetsBinding.instance.addPostFrameCallback((_){
              final AuthStatus status = snapshot.data!;
              if( status == AuthStatus.loggedInAndVerified ){
                Get.offNamed( AppRoutes.mainNavScreen );
              }else if( status == AuthStatus.loggedInNotVerified ){
                Get.offNamed( AppRoutes.verifyAccountScreen );
              }else{
                Get.offNamed( AppRoutes.onBoardingScreen );
              }
            });

            return const SizedBox.shrink();

          }
      )
    );
  }

  //STACK WIDGET TO SHOW WHILE SNAPSHOT IS LOADING
Widget splashStack(){
    return Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 531.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: AppColors.greenGradient
                ),
              )
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox( height: 80.h,),
                CustomAssetImage(
                    assetPath: Assets.images.splashOnboarding.keyName,
                    height: 369,
                    width: 246
                ),
                CustomAssetImage(
                    assetPath: Assets.images.logo.keyName,
                    height: 187,
                    width: 332
                ),
                TextWidget(text: AppStrings.quickBites,
                  fontSize: 20,
                  fontColor: AppColors.grey72,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox( height: 70.h,),
                TextWidget(text: AppStrings.tasteTheMagic,
                  fontSize: 16,
                  fontColor: AppColors.white,
                ),
              ],
            ),
          ),
        ]
    );
}
}
