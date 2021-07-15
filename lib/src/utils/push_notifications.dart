import 'dart:developer';
//import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
 // final FirebaseMessaging _fcm = FirebaseMessaging.instance;

//  PushNotificationService._();
//  static final PushNotificationService _instance = PushNotificationService._();
//  static PushNotificationService get instance => _instance;

//  Future<String?> getToken() => _fcm.getToken();

  Future<void> initialise() async {
    try {
    //  final settings = await _fcm.requestPermission();
    //  log('User granted permission: ${settings.authorizationStatus}');
    } catch (e) {
      log(e.toString());
    }
  }
}
