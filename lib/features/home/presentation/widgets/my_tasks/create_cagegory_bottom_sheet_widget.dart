import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/widgets/custom_button.dart';
import 'package:tasky/core/common/widgets/custom_text_field.dart';
import 'package:tasky/core/common/widgets/text_app.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/service/shared_pref/pref_keys.dart';
import 'package:tasky/core/service/shared_pref/shared_pref.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';
import 'package:tasky/core/toast/show_toast.dart';
import 'package:tasky/features/home/data/model/add_task_request_body.dart';
import 'package:tasky/features/home/presentation/bloc/add_tasks/add_tasks_bloc.dart';

class CreateCagegoryBottomSheet extends StatefulWidget {
  const CreateCagegoryBottomSheet({super.key});

  @override
  State<CreateCagegoryBottomSheet> createState() =>
      _CreateCagegoryBottomSheetState();
}

class _CreateCagegoryBottomSheetState extends State<CreateCagegoryBottomSheet> {
  final formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Center(
              child: TextApp(
                text: 'Add Task',
                theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontweightHelper.bold,
                    color: Colors.black),
              ),
            ),

            verticalSpace(10.h),
            //Task note
            TextApp(
              text: 'Enter the Task',
              theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontweightHelper.medium,
                  color: Colors.black),
            ),
            verticalSpace(10.h),
            CustomTextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              hintText: 'Task name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Task Note is required';
                }
                return null;
              },
            ),
            verticalSpace(10.h),
            BlocConsumer<AddTasksBloc, AddTasksState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    Navigator.pop(context);

                    ShowToast.showToastSuccessTop(
                      message: 'Task Added successfully',
                      seconds: 2,
                    );
                  },
                  error: (message) {
                    ShowToast.showToastErrorTop(
                      message: message,
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return SizedBox(
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    );
                  },
                  orElse: () {
                    return CustomButton(
                      onPressed: () async {
                        await _validaeandcreate(context);
                      },
                      text: 'Add a New Task',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      lastRadius: 20,
                      threeRadius: 20,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _validaeandcreate(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      context.read<AddTasksBloc>().add(AddTasksEvent.addTasks(
          body: AddTaskRequestBody(todo: titleController.text.trim(),
          completed: 'false',
          userId: SharedPref().getInt(PrefKeys.userId)!,
          )));
    }
  }
}
