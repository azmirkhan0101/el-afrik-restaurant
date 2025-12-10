// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apple_login.svg
  String get appleLogin => 'assets/icons/apple_login.svg';

  /// File path: assets/icons/camera.svg
  String get camera => 'assets/icons/camera.svg';

  /// File path: assets/icons/eye.svg
  String get eye => 'assets/icons/eye.svg';

  /// File path: assets/icons/eye_hide.svg
  String get eyeHide => 'assets/icons/eye_hide.svg';

  /// File path: assets/icons/facebook_login.svg
  String get facebookLogin => 'assets/icons/facebook_login.svg';

  /// File path: assets/icons/google_login.svg
  String get googleLogin => 'assets/icons/google_login.svg';

  /// File path: assets/icons/lock.svg
  String get lock => 'assets/icons/lock.svg';

  /// List of all assets
  List<String> get values => [
    appleLogin,
    camera,
    eye,
    eyeHide,
    facebookLogin,
    googleLogin,
    lock,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/complete.png
  AssetGenImage get complete =>
      const AssetGenImage('assets/images/complete.png');

  /// File path: assets/images/confetti.png
  AssetGenImage get confetti =>
      const AssetGenImage('assets/images/confetti.png');

  /// File path: assets/images/create_password_graphics.png
  AssetGenImage get createPasswordGraphics =>
      const AssetGenImage('assets/images/create_password_graphics.png');

  /// File path: assets/images/forgot_password_graphics.png
  AssetGenImage get forgotPasswordGraphics =>
      const AssetGenImage('assets/images/forgot_password_graphics.png');

  /// File path: assets/images/happy_birthday.png
  AssetGenImage get happyBirthday =>
      const AssetGenImage('assets/images/happy_birthday.png');

  /// File path: assets/images/login_background.png
  AssetGenImage get loginBackground =>
      const AssetGenImage('assets/images/login_background.png');

  /// File path: assets/images/login_graphics.png
  AssetGenImage get loginGraphics =>
      const AssetGenImage('assets/images/login_graphics.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo1024.png
  AssetGenImage get logo1024 =>
      const AssetGenImage('assets/images/logo1024.png');

  /// File path: assets/images/no_internet.png
  AssetGenImage get noInternet =>
      const AssetGenImage('assets/images/no_internet.png');

  /// File path: assets/images/no_menu_available.png
  AssetGenImage get noMenuAvailable =>
      const AssetGenImage('assets/images/no_menu_available.png');

  /// File path: assets/images/no_reward.png
  AssetGenImage get noReward =>
      const AssetGenImage('assets/images/no_reward.png');

  /// File path: assets/images/onboarding_graphics.png
  AssetGenImage get onboardingGraphics =>
      const AssetGenImage('assets/images/onboarding_graphics.png');

  /// File path: assets/images/otp_graphics.png
  AssetGenImage get otpGraphics =>
      const AssetGenImage('assets/images/otp_graphics.png');

  /// File path: assets/images/out_of_stock.png
  AssetGenImage get outOfStock =>
      const AssetGenImage('assets/images/out_of_stock.png');

  /// File path: assets/images/pickup_graphics.png
  AssetGenImage get pickupGraphics =>
      const AssetGenImage('assets/images/pickup_graphics.png');

  /// File path: assets/images/qr_scanner.png
  AssetGenImage get qrScanner =>
      const AssetGenImage('assets/images/qr_scanner.png');

  /// File path: assets/images/splash_onboarding.png
  AssetGenImage get splashOnboarding =>
      const AssetGenImage('assets/images/splash_onboarding.png');

  /// File path: assets/images/warning.png
  AssetGenImage get warning => const AssetGenImage('assets/images/warning.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    complete,
    confetti,
    createPasswordGraphics,
    forgotPasswordGraphics,
    happyBirthday,
    loginBackground,
    loginGraphics,
    logo,
    logo1024,
    noInternet,
    noMenuAvailable,
    noReward,
    onboardingGraphics,
    otpGraphics,
    outOfStock,
    pickupGraphics,
    qrScanner,
    splashOnboarding,
    warning,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
