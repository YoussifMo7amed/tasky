import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/widgets/custom_tapbar.dart';
import 'package:tasky/core/common/widgets/text_app.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';
import 'package:tasky/features/home/presentation/screens/tasks/All_Tasks_Screen.dart';
import 'package:tasky/features/home/presentation/screens/tasks/my_tasks_screen.dart';
import 'package:tasky/features/home/presentation/screens/tasks/completed_tasks_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            //home text
            TextApp(
              text: 'My Tasks',
              theme: context.textStyle.copyWith(
                fontSize: 24.sp,
                fontWeight: FontweightHelper.bold,
                color: const Color(0XFF24252C),
              ),
            ),
            verticalSpace(15.h),
            //custom tap bar
            const CustomTapBar(items: [
              'All Tasks',
              'My Tasks',
              'completed',
            ], screens: [
              Expanded(child: AllTasksScreen()),
              Expanded(child: MyTasksScreen()),
              Expanded(child: CompletedTasksScreen()),
            ],)
            
          ],
        ),
      )),
    );
  }
}
