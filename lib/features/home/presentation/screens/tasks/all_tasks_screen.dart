// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/refactors/all_tasks_body.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child:AllTasksBody()),
      ],
    );
  }
}