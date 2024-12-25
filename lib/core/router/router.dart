import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/feats/clipboard_demo_screen/clipboard_demo_screen.dart';
import 'package:keeper/feats/file_operations_demo_screen/file_operations_demo_screen.dart';
import 'package:keeper/feats/keeper/screens/keeper_home_screen/keeper_home_screen.dart';
import 'package:keeper/feats/long_list_demo_screen/long_list_demo_screen.dart';
import 'package:keeper/feats/main_menu_screen/main_menu_screen.dart';
import 'package:keeper/feats/notification_demo_screen/notification_demo_screen.dart';
import 'package:keeper/feats/resize_window_demo_screen/resize_window_demo_screen.dart';

extension AppRoutes on BuildContext {
  String get mainMenuRoute => (MainMenuScreen).toString();

  String get keeperRoute => (KeeperHomeScreen).toString();

  String get windowResizeDemoRoute => (ResizeWindowDemoScreen).toString();

  String get clipboardDemoRoute => (ClipboardDemoScreen).toString();

  String get notificationsDemoRoute => (NotificationDemoScreen).toString();

  String get fileOperationsDemoRoute => (FileOperationsDemoScreen).toString();

  String get longListDemoScreenRoute => (LongListDemoScreen).toString();
}

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: (MainMenuScreen).toString(),
      path: '/',
      builder: (context, state) => const MainMenuScreen(),
    ),
    GoRoute(
      name: (KeeperHomeScreen).toString(),
      path: '/home',
      builder: (context, state) => const KeeperHomeScreen(),
    ),
    GoRoute(
      name: (ResizeWindowDemoScreen).toString(),
      path: '/resize-window',
      builder: (context, state) => const ResizeWindowDemoScreen(),
    ),
    GoRoute(
      name: (ClipboardDemoScreen).toString(),
      path: '/clipboard',
      builder: (context, state) => const ClipboardDemoScreen(),
    ),
    GoRoute(
      name: (NotificationDemoScreen).toString(),
      path: '/notifications',
      builder: (context, state) => const NotificationDemoScreen(),
    ),
    GoRoute(
      name: (FileOperationsDemoScreen).toString(),
      path: '/file-operation',
      builder: (context, state) => const FileOperationsDemoScreen(),
    ),
    GoRoute(
      name: (LongListDemoScreen).toString(),
      path: '/long-list',
      builder: (context, state) => const LongListDemoScreen(),
    ),
  ],
);
