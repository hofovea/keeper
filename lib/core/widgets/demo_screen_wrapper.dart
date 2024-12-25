import 'package:flutter/material.dart';

class BaseScreenWrapper extends StatelessWidget {
  final List<Widget> children;
  final Widget? appBarTitle;
  final bool centerContent;

  const BaseScreenWrapper({super.key, required this.children, this.appBarTitle, this.centerContent = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: centerContent ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
