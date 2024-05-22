import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/refactors/my_tasks_body.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Expanded(
          child: MyTasksBody()),
    ]);
  }
}
