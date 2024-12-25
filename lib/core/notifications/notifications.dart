import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> setupNotificationsPlugin() async {
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

Future<void> onDidReceiveLocalNotification(
  int id,
  String? title,
  String? body,
  String? payload,
) async {
  print('Received local notification: $title, $body');
}
