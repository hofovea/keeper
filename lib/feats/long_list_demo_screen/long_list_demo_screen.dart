import 'package:flutter/material.dart';
import 'package:keeper/core/widgets/demo_screen_wrapper.dart';

class LongListDemoScreen extends StatelessWidget {
  static const int _itemCount = 1000000;

  const LongListDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _itemCount,
        prototypeItem: const ListTile(
          leading: CircleAvatar(
            child: Text('${1}'),
          ),
          title: Text('Item 0'),
          subtitle: Text('This is item number 0'),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Item $index'),
            subtitle: Text('This is item number $index'),
          );
        },
      ),
    );
  }
}
