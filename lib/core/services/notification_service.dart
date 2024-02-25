import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:app_core_module/core/hive_db_provider.dart';
import 'package:app_core_module/core/utils/app_logger.dart';

class NotificationService {

  String tokenKey = "fcm_token";

  Future<void> init() async {
    if(kIsWeb){
      return;
    }
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.setAutoInitEnabled(true);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    AppLogger.i('User granted permission: ${settings.authorizationStatus}');
    await manageToken();
  }

 Future<void> manageToken() async {
    if(kIsWeb){
      return;
    }
   FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    HiveDBProvider.create(tokenKey,
        token,
    );
    AppLogger.i("FCM TOKEN -$token");
  }

  String get getToken => HiveDBProvider.get(tokenKey);

}
