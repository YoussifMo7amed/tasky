import 'package:flutter/material.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';
import 'package:tasky/core/common/widgets/text_app.dart';

class OnBoardingTittle extends StatelessWidget {
  const OnBoardingTittle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: CustomFadeInLeft(
        duration: 400,
        child: Column(
          children: [
            TextApp(
              textAlign: TextAlign.center,
                text: 'Task Management &\nTo-Do List',
                theme: context.textStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontweightHelper.bold,
                ),),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  30.0),
              child: TextApp(
                textAlign: TextAlign.center,
                maxLines: 3,
                text: 'This productive tool is designed to help you better manage your task project-wise conveniently!', theme: context.textStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontweightHelper.regular,
                  color: Colors.grey.shade600,
                  )
                ),
            ),
          ],
        ),
      ),
    );
  }
}
