import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class Fcm {
  final FirebaseMessaging messaging;
  // late messaging;

  Fcm(
    this.messaging,
  ) {
    // FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);
    FirebaseMessaging.onMessage.listen((event) {
      log(event.toString());
      print(event.data);
      print(event.notification?.body);
    });
  }
}
