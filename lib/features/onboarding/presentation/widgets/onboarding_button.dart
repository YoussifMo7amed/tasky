import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/widgets/custom_button.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/routes/routers.dart';
import 'package:tasky/core/styles/colors/colors_light.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   CustomFadeInLeft(
      duration: 400,
      child: CustomButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(Routes.login,
                      predicate: (_) => false);
                },
                backgroundColor: ColorsLight.blueLight,
                lastRadius: 10,
                threeRadius: 10,
                text: 'Let’s Start',
                width: MediaQuery.of(context).size.width,
                height: 40.h),
    );
  }
}