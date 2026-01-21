import 'package:el_afrik_restaurant/core/api_service.dart';
import 'package:el_afrik_restaurant/core/firebase_notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'main_app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Get.putAsync((){
    return ApiService().init();
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotificationService.instance.initialize();
  String? token = await FirebaseMessaging.instance.getToken();
  print("Device Token: $token");
  runApp( MainApp() );
}