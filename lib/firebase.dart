// ignore_for_file: avoid_print, non_constant_identifier_names
import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseApi{
  final _firebaseMessage=FirebaseMessaging.instance;
  Future<void> FunctionGetToken() async {
    await _firebaseMessage.requestPermission();
   await _firebaseMessage.getToken();

    FirebaseMessaging.onBackgroundMessage(handMessages);

  }
}
Future<void> handMessages(RemoteMessage message) async{
  print('Title :${message.notification?.title}');
  print('Body :${message.notification?.body}');
  print('Payload :${message.data}');
}

FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

void requestNotificationPermissions() async {
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    // print('User granted permission');
  } else {
    // print('User declined permission');
  }
}