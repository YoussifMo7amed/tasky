import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/features/home/presentation/widgets/my_tasks/task_activity.dart';
import 'package:tasky/features/home/presentation/widgets/my_tasks/task_tittle.dart';

class BuildTaskItem extends StatelessWidget {
  const BuildTaskItem({
    required this.text
    ,super.key, required this.id, required this.userId});
    final int id;
      final int userId;

final String text;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInLeft(
      duration: 400,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        width: double.infinity,
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(5.h),
            //task tittle
             TaskTittle(text: text,),
            verticalSpace(5.h),
            //edit & delete &completed task
             TaskActivity(id: id,userId: userId,),
          ],
        ),
      ),
    );
  }
}
