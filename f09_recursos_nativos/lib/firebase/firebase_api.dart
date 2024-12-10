import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  

  Future<void> initNotificaction() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('My token: ${fcmToken}');
    FirebaseMessaging.onBackgroundMessage(handlerBackgroundMessage);

  }

}

Future<void> handlerBackgroundMessage(RemoteMessage remoteMessage) async {

    print("${remoteMessage.notification?.title}");
    print("${remoteMessage.notification?.body}");

  }