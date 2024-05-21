import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/widgets/text_app.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';
import 'package:tasky/core/styles/images/app_images.dart';
import 'package:tasky/features/auth/presentation/widgets/signup/signup_button.dart';
import 'package:tasky/features/auth/presentation/widgets/signup/signup_text_button.dart';
import 'package:tasky/features/auth/presentation/widgets/signup/signup_textfield.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //sign up image
          CustomFadeInDown(
            duration: 400,
            child: Center(
              child: Expanded(
                child: Image.asset(
                  height: 340.h,
                  fit: BoxFit.fitHeight,
                  AppImages.onboarding,
                ),
              ),
            ),
          ),
          //sign up text
          CustomFadeInLeft(
            duration: 200,
            child: TextApp(
              text: 'Sign Up',
              theme: context.textStyle
                  .copyWith(fontSize: 24.sp, fontWeight: FontweightHelper.bold),
            ),
          ),
          verticalSpace(10.h),
          // sign up textfield
          const SignUpTextForm(),
          verticalSpace(10.h),
          //sign up button
          const SignUpButton(),
          verticalSpace(10.h),
          //login textbutton
          const SignUpTextButton(),
        ],
      ),
    ));
  }
}
