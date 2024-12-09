import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handlerBackgroundMessage(RemoteMessage remoteMessage) async {

    print("${remoteMessage.notification?.title}");
    print("${remoteMessage.notification?.body}");

  }

  Future<void> initNotificaction() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = _firebaseMessaging.getToken();
    print('My token: ${fcmToken}');
    FirebaseMessaging.onBackgroundMessage(handlerBackgroundMessage);

  }

}