import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/widgets/text_app.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';
import 'package:tasky/core/styles/images/app_images.dart';
import 'package:tasky/features/auth/presentation/widgets/login/login_button.dart';
import 'package:tasky/features/auth/presentation/widgets/login/login_text_button.dart';
import 'package:tasky/features/auth/presentation/widgets/login/login_textfield.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          //login Image
          CustomFadeInDown(
            duration: 400,
            child: Center(
              child: Expanded(
                child: Image.asset(
                  height: 400.h,
                  AppImages.onboarding,fit: BoxFit.cover,),
              ),
            ),
          ),
          //login text
          CustomFadeInLeft(
            duration: 200,
            child: TextApp(
              text: 'Login',
              theme: context.textStyle
                  .copyWith(fontSize: 24.sp, fontWeight: FontweightHelper.bold),
            ),
          ),
          verticalSpace(10.h),
          //Login TextField
          const LoginTextForm(),
          verticalSpace(10.h),
          //login button
        const  LoginButton(), 
         verticalSpace(10.h),
         //login textbutton
        const LoginTextButton(), 
                ],
              ),
        ));
  }
}
