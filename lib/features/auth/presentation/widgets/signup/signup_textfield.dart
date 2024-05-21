import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/widgets/custom_text_field.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/utils/app_regex.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isshowpassword = true;
  // late final AuthBloc _bloc;
  @override
  void initState() {
    super.initState();
    // _bloc = context.read<AuthBloc>();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _bloc.emailController.dispose();
    // _bloc.passwordController.dispose();
   
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      // key:_bloc.formKey,
      child: Column(
        children: [
          //name textform
           CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              //controller: _bloc.nameController,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
                  return 'name is too short';
                }
                return null;
              },
              hintText: 'Name..',
            ),
          ),
          verticalSpace(10.h),
          //email textform
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
            //  controller: _bloc.emailController,
            controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!AppRegex.isEmailValid('_bloc.emailController.text')) {
                  return 'email is not valid';
                }
                return null;
              },
              hintText:'Email..',
            ),
          ),
          verticalSpace(10.h),
          //password textform
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              obscureText: isshowpassword,
              controller: TextEditingController(),
              // controller: _bloc.passwordController,
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
