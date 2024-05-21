import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/widgets/custom_text_field.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/features/auth/presentation/bloc/auth_bloc.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isshowpassword = true;
  late final AuthBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }
@override
  void dispose() {
   
    super.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
   
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_bloc.formKey,
      child: Column(
        children: [
          //email textform
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
             controller: _bloc.nameController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                  return 'password is too short';
                }
                
                return null;
              },
              hintText:'Name..',
            ),
          ),
          verticalSpace(10.h),
          //password textform
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              obscureText: isshowpassword,
              controller: _bloc.passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'password is too short';
                }
                return null;
              },
              hintText: 'Password..',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isshowpassword = !isshowpassword;
                  });
                },
                icon: Icon(
                  !isshowpassword ? Icons.visibility : Icons.visibility_off,
                  
                ),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
