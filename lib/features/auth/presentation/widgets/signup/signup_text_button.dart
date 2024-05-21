import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/widgets/text_app.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/routes/routers.dart';
import 'package:tasky/core/styles/colors/colors_light.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,
      
      ),
      child: CustomFadeInLeft(
        duration: 400,
        child: Row(
          children: [ 
            TextApp(text: "Already have an account?", theme:context.textStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontweightHelper.regular,
              color: Colors.black
            ),),
             TextButton(onPressed: () {
                context.pushReplacementNamed(Routes.login);
              }, 
              child: TextApp(
                text: 'Sign in',
                theme: context.textStyle.copyWith(
                  color:ColorsLight.blueLight,
                  fontSize: 16.sp,
                  fontWeight: FontweightHelper.medium,
                ),
              ),),
          ],
        ),
      ),
    );
  }
}