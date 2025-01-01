import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keeper/core/core.dart';
import 'package:windows_notification/notification_message.dart';

class NotificationDemoScreen extends StatelessWidget {
  const NotificationDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenWrapper(
      children: [
        ElevatedButton(
          onPressed: () async {
            if (Platform.isWindows) {
              NotificationMessage message =
                  NotificationMessage.fromPluginTemplate(
                "id1",
                "TITLE ON WINDOWS",
                "Some useful content",
              );
              winNotifyPlugin.showNotificationPluginTemplate(message);
            } else {
              const macOSNotificationDetails =
                  DarwinNotificationDetails(subtitle: 'Here is some text');
              const linuxOSNotificationDetails = LinuxNotificationDetails();
              const notificationDetails = NotificationDetails(
                macOS: macOSNotificationDetails,
                linux: linuxOSNotificationDetails,
              );
              await flutterLocalNotificationsPlugin.show(
                0,
                'Test Notification',
                Platform.isLinux
                    ? 'This is a test notification on Linux.'
                    : 'This is a test notification on macOS.',
                notificationDetails,
              );
            }
          },
          child: const Text('Send local notification'),
        ),
      ],
    );
  }
}
