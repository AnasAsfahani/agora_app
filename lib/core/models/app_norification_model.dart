import 'package:firebase_messaging/firebase_messaging.dart';

class AppNotificationModel {
  final String? title;
  final String? body;
  final Map<String, dynamic> data;

  AppNotificationModel({
    required this.title,
    required this.body,
    required this.data,
  });

  factory AppNotificationModel.fromRemoteMessage(RemoteMessage message) {
    return AppNotificationModel(
      title: message.notification?.title,
      body: message.notification?.body,
      data: message.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "body": body,
      "data": data,
    };
  }

  factory AppNotificationModel.fromMap(Map<String, dynamic> map) {
    return AppNotificationModel(
      title: map["title"] as String?,
      body: map["body"] as String?,
      data: Map<String, dynamic>.from(map["data"] ?? {}),
    );
  }

  @override
  String toString() =>
      "AppNotification(title: $title, body: $body, data: $data)";
}
