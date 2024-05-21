import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/widgets/text_app.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';
class TaskTittle extends StatelessWidget {
  const TaskTittle({
    required this.text,
    super.key,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return TextApp(
    text: text,
     maxLines: 2,
     textOverflow: TextOverflow.ellipsis,
     theme: context.textStyle.copyWith(
       fontSize: 16.sp,
       fontWeight: FontweightHelper.medium,
       color: const Color(0XFF24252C),
     )  
                );
  }
}