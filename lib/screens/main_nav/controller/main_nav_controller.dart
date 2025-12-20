import 'package:el_afrik_restaurant/screens/cart/cart_screen.dart';
import 'package:el_afrik_restaurant/screens/home/home/home_screen.dart';
import 'package:el_afrik_restaurant/screens/order/order/order_screen.dart';
import 'package:el_afrik_restaurant/screens/profile/profile_screen.dart';
import 'package:el_afrik_restaurant/screens/qr_scan/qr_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainNavController extends GetxController{

  RxInt currentIndex = 0.obs;

  List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    QrScanScreen(),
    CartScreen(),
    ProfileScreen()
  ];
}