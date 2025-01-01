import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:windows_notification/notification_message.dart';
import 'package:windows_notification/windows_notification.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final winNotifyPlugin = WindowsNotification(
  applicationId:
      r"{9aaabc6b-ee42-4274-9c6e-a96c05cad646\WindowsPowerShell\v1.0\powershell.exe",
);

Future<void> setupNotificationsPlugin() async {
  if (!Platform.isWindows) {
    const initializationSettingsDarwin = DarwinInitializationSettings();
    const initializationSettingsLinux = LinuxInitializationSettings(
      defaultActionName: 'Open notification',
    );
    const initializationSettings = InitializationSettings(
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print('Notification clicked with payload: ${response.payload}');
      },
    );
  }
}

Future<void> onDidReceiveLocalNotification(
  int id,
  String? title,
  String? body,
  String? payload,
) async {
  print('Received local notification: $title, $body');
}
