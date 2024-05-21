import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/refactors/completed_tasks_body.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: CompletedTasksBody()),
      ]
    );
  }
}