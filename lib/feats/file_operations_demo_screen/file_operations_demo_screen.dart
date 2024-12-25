import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:keeper/core/core.dart';

class FileOperationsDemoScreen extends StatefulWidget {
  const FileOperationsDemoScreen({super.key});

  @override
  State<FileOperationsDemoScreen> createState() => _FileOperationsDemoScreenState();
}

class _FileOperationsDemoScreenState extends State<FileOperationsDemoScreen> {
  final TextEditingController _textController = TextEditingController();
  String _fileContent = '';
  String? _currentFilePath;

  @override
  Widget build(BuildContext context) {
    return BaseScreenWrapper(
      children: [
        TextField(
          controller: _textController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter text to save',
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _pickFileToLoad,
              child: const Text("Load File"),
            ),
            ElevatedButton(
              onPressed: _pickLocationToSave,
              child: const Text("Save File"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'File Content:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              _fileContent,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
      ],
    );
  }

  /// Allows the user to pick a file and read its content.
  Future<void> _pickFileToLoad() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        final content = await file.readAsString();
        setState(() {
          _fileContent = content;
          _currentFilePath = file.path;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("File loaded successfully!")),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No file selected.")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error loading file: $e")),
        );
      }
    }
  }

  /// Allows the user to pick a location to save the file.
  Future<void> _pickLocationToSave() async {
    if (_textController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter some text to save.")),
      );
      return;
    }

    try {
      final result = await FilePicker.platform.saveFile(
        dialogTitle: "Select location to save",
        fileName: "example.txt",
      );

      if (result != null) {
        final file = File(result);
        await file.writeAsString(_textController.text);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("File saved successfully!")),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Save operation canceled.")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error saving file: $e")),
        );
      }
    }
  }
}
