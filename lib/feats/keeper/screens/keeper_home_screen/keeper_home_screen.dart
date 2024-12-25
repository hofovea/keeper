import 'package:flutter/material.dart';
import 'package:keeper/feats/keeper/screens/keeper_home_screen/widgets/todo_list/todo_list.dart';

class KeeperHomeScreen extends StatelessWidget {
  const KeeperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TodoList(),
    );
  }
}
