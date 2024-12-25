import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:keeper/core/core.dart';
import 'package:window_manager/window_manager.dart';

class ResizeWindowDemoScreen extends StatefulWidget {
  const ResizeWindowDemoScreen({super.key});

  @override
  State<ResizeWindowDemoScreen> createState() => _ResizeWindowDemoScreenState();
}

class _ResizeWindowDemoScreenState extends State<ResizeWindowDemoScreen> with WindowListener {
  String _currentWindowSize = 'Change window size to see current size';

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _init();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    await windowManager.setPreventClose(true);
    setState(() {});
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose && mounted) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Are you sure you want to close this window?'),
            actions: [
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await windowManager.destroy();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void onWindowResize() {
    setState(() {
      _currentWindowSize = 'Current window size is ${MediaQuery.of(context).size.height}x${MediaQuery.of(context).size.width}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWrapper(
      appBarTitle: const Text(
        'This screen contains various buttons to demonstrate app behaviour on close and methods to modify screen size',
        textAlign: TextAlign.center,
        maxLines: 4,
      ),
      children: [
        ElevatedButton(
          onPressed: () async {
            await DesktopWindow.setWindowSize(
              const Size(700, 700),
            );
          },
          child: const Text('Set window size to 700x700'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await windowManager.maximize();
          },
          child: const Text('Set window size to fullscreen size'),
        ),
        const SizedBox(height: 10),
        Text(_currentWindowSize),
      ],
    );
  }
}
