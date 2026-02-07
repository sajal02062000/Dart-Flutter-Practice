import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        const InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            defaultPresentAlert: true,
            defaultPresentBadge: true,
            defaultPresentSound: true,
          ),
        );

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          final data = jsonDecode(response.payload!);
          handleRouting(data);
        }
      },
    );
  }

  Future<void> showNotification(
    RemoteNotification notification,
    Map<String, dynamic> data,
  ) async {
    try {
      // Get the image URL from the notification data
      final String? imageUrl =
          notification.android?.imageUrl ?? data['android']?['imageUrl'];

      ByteArrayAndroidBitmap? bigPicture;
      ByteArrayAndroidBitmap? largeIcon;

      if (imageUrl != null && imageUrl.isNotEmpty) {
        // Fetch the image
        final http.Response response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          final imageBytes = response.bodyBytes;

          // Convert image bytes to Base64 string
          bigPicture = ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(imageBytes),
          );
          largeIcon = ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(imageBytes),
          );
        }
      }

      // Configure BigPictureStyleInformation
      final BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(
            bigPicture!,
            largeIcon: largeIcon,
            contentTitle: notification.title,
            summaryText: notification.body,
            htmlFormatContent: true,
            htmlFormatContentTitle: true,
          );

      // Show the notification
      await flutterLocalNotificationsPlugin.show(
        id: Random.secure().nextInt(1000),
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            "defaultNotificationChannelId",
            "Default Channel",
            priority: Priority.max,
            importance: Importance.high,
            playSound: true,
            sound: notification.android?.sound != null
                ? RawResourceAndroidNotificationSound(
                    notification.android?.sound,
                  )
                : null,
            channelShowBadge: true,
            enableVibration: true,
            enableLights: true,
            styleInformation: bigPictureStyleInformation,
            icon: '@mipmap/ic_launcher',
            largeIcon: largeIcon,
          ),
          iOS: notification.apple?.sound?.name != null
              ? DarwinNotificationDetails(
                  sound: notification.apple?.sound?.name,
                )
              : null,
        ),
        payload: jsonEncode(data),
      );
    } catch (e) {
      log("Error showing notification with image: $e");
      await flutterLocalNotificationsPlugin.show(
        id: Random.secure().nextInt(1000),
        title: notification.title,
        body: notification.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            "defaultNotificationChannelId",
            "Default Channel",
            playSound: true,
            sound: notification.android?.sound != null
                ? RawResourceAndroidNotificationSound(
                    notification.android?.sound,
                  )
                : null,
            channelShowBadge: true,
            enableVibration: true,
            enableLights: true,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: notification.apple?.sound?.name != null
              ? DarwinNotificationDetails(
                  sound: notification.apple?.sound?.name,
                )
              : null,
        ),
        payload: jsonEncode(data),
      );
    }
  }

  void handleRouting(Map<String, dynamic> data) {
    try {
      final screenName = data['to_redirect'] ?? '';
      if (screenName.isNotEmpty) {
        // Handle routing here
      } else {
        if (kDebugMode) {
          print('No "to_redirect" key in notification data.');
        }
      }
    } catch (e) {
      log('Error during notification routing: $e');
    }
  }
}
