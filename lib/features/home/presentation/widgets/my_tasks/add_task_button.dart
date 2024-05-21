import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/common/animations/animate_do.dart';
import 'package:tasky/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:tasky/core/common/widgets/custom_button.dart';
import 'package:tasky/core/di/injection_container.dart';
import 'package:tasky/core/service/shared_pref/pref_keys.dart';
import 'package:tasky/core/service/shared_pref/shared_pref.dart';
import 'package:tasky/core/styles/colors/colors_light.dart';
import 'package:tasky/features/home/presentation/bloc/add_tasks/add_tasks_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/get_all_tasks/get_all_tasks_bloc.dart';
import 'package:tasky/features/home/presentation/widgets/my_tasks/create_cagegory_bottom_sheet_widget.dart';

class AddTasksButton extends StatelessWidget {
  const AddTasksButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   CustomFadeInLeft(
      duration: 400,
      child: CustomButton(
                onPressed: () {
                       CagegoryModalBottomSheet.showModalCategoryBottomSheet(
              context: context,
              widget: 
              
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<AddTasksBloc>(),
                  ),
                 
                ],
                child: const CreateCagegoryBottomSheet(),
                
              ),

              whencompleted: () {
                //get all tasks
                int id =SharedPref().getInt(PrefKeys.userId)!;
                context.read<GetAllTasksBloc>().add(
                      GetAllTasksEvent.getTasks(id: id),
                    );
             },
            );
                },
                backgroundColor: ColorsLight.blueLight,
                lastRadius: 10,
                threeRadius: 10,
                text: 'Add Task',
                width: MediaQuery.of(context).size.width,
                height: 40.h),
    );
  }
}