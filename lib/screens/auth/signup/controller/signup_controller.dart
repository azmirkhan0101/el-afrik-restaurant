import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String contactNumber = "";
  late final DateTime? dateOfBirth;

  final Rx<File?> profileImage = Rx<File?>(null);

}