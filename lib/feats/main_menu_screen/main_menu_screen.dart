import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/core.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreenWrapper(
      children: [
        ElevatedButton(
          onPressed: () {
            context.pushNamed(context.keeperRoute);
          },
          child: const Text('Go to keeper'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(context.windowResizeDemoRoute);
          },
          child: const Text('Go to resize window demo'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(context.clipboardDemoRoute);
          },
          child: const Text('Go to clipboard demo'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(context.notificationsDemoRoute);
          },
          child: const Text('Go to notifications demo'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(context.fileOperationsDemoRoute);
          },
          child: const Text('Go to file operations demo'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(context.longListDemoScreenRoute);
          },
          child: const Text('Go to long list demo'),
        ),
      ],
    );
  }
}
