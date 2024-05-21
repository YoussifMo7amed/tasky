import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/widgets/custom_button.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/routes/routers.dart';
import 'package:tasky/core/styles/colors/colors_light.dart';
import 'package:tasky/core/toast/show_toast.dart';
import 'package:tasky/features/auth/presentation/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
  state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: 'Login Success',
            );
            context.pushNamedAndRemoveUntil(Routes.home, predicate: (_) => false);
          },
          error: (message) {
            ShowToast.showToastErrorTop(
              message:message,
            );
          },
        );
      },
      builder: (context, state) {
       return
        state.maybeWhen(
          loading: () {
           return CustomFadeInLeft(
          duration: 400,
          child: SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: Center(child: const CircularProgressIndicator(
              color: ColorsLight.blueLight,
            )),
          )
        );
          },
          orElse: () {
               return CustomFadeInLeft(
          duration: 400,
          child: CustomButton(
              onPressed: () {
                _validateThenDoLogin(context);
              },
              backgroundColor: ColorsLight.blueLight,
              lastRadius: 10,
              threeRadius: 10,
              text: 'Login',
              width: MediaQuery.of(context).size.width,
              height: 40.h),
        );
          },
        );
        
     
      },
    );
  }
    void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
