import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keeper/core/core.dart';

class ClipboardDemoScreen extends StatefulWidget {
  const ClipboardDemoScreen({super.key});

  @override
  State<ClipboardDemoScreen> createState() => _ClipboardDemoScreenState();
}

class _ClipboardDemoScreenState extends State<ClipboardDemoScreen> {
  final _sampleClipboardText = 'Clipboard demo';
  String? _currentClipboard;

  @override
  Widget build(BuildContext context) {
    return BaseScreenWrapper(
      children: [
        ElevatedButton(
          onPressed: () async {
            await Clipboard.setData(
              ClipboardData(text: _sampleClipboardText),
            );
          },
          child: const Text('Copy sample text to clipboard'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            if (mounted) {
              final clipboardData = await Clipboard.getData('text/plain');
              setState(() {
                _currentClipboard = clipboardData?.text;
              });
            }
          },
          child: const Text('Click to see current clipboard text'),
        ),
        const SizedBox(height: 10),
        Text(_currentClipboard ?? 'Clipboard is empty'),
      ],
    );
  }
}
