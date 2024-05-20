import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/styles/images/app_images.dart';
import 'package:tasky/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:tasky/features/onboarding/presentation/widgets/onboarding_tittle.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          //onboarding image
          CustomFadeInDown(
            duration: 400,
            child: Image.asset(AppImages.onboarding)),
          //onboarding text
          const OnBoardingTittle(),
          verticalSpace(10.h),
          //onboarding button
       const OnBoardingButton()
        ],
      ),
    ));
  }
}
