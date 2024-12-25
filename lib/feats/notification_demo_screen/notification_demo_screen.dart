import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keeper/core/core.dart';

class NotificationDemoScreen extends StatelessWidget {
  const NotificationDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenWrapper(
      children: [
        ElevatedButton(
          onPressed: () async {
            const macOSNotificationDetails = DarwinNotificationDetails(subtitle: 'Here is some text');
            const linuxOSNotificationDetails = LinuxNotificationDetails();
            const notificationDetails = NotificationDetails(
              macOS: macOSNotificationDetails,
              linux: linuxOSNotificationDetails,
            );
            await flutterLocalNotificationsPlugin.show(
              0,
              'Test Notification',
              'This is a test notification on macOS.',
              notificationDetails,
            );
          },
          child: const Text('Send local notification'),
        ),
      ],
    );
  }
}
