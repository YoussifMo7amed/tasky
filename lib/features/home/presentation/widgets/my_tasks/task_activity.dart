import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/injection_container.dart';
import 'package:tasky/core/toast/show_toast.dart';
import 'package:tasky/features/home/data/model/update_task_request_body.dart';
import 'package:tasky/features/home/presentation/bloc/delete_task/delete_task_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/get_all_tasks/get_all_tasks_bloc.dart';
import 'package:tasky/features/home/presentation/bloc/update_task/update_task_bloc.dart';

class TaskActivity extends StatelessWidget {
  const TaskActivity({
    super.key,
    required this.id,
    required this.userId
  });
  final int id;
  final int userId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GetAllTasksBloc>()),
        BlocProvider(create: (context) => sl<UpdateTaskBloc>()),
        BlocProvider(create: (context) => sl<DeleteTaskBloc>(),)
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            BlocConsumer<DeleteTaskBloc, DeleteTaskState>(
            listener: (context, state) {
              state.when(
                  loading: () {},
                  success: () {
                    context.read<GetAllTasksBloc>().add(
                          GetAllTasksEvent.getTasks(id: userId),
                        );
                    ShowToast.showToastSuccessTop(message: 'Task deleted');
                  },
                  error: (message) {
                    ShowToast.showToastErrorTop(message: message);
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return   IconButton(
            onPressed: () {
              context.read<DeleteTaskBloc>().add(
                        DeleteTaskEvent.deleteTask(
                            taskId: id,  ));
                 
            },
            icon: const Icon(
              Icons.delete,
              color: Color(0xff9395D3),
            ),
          );
              });
            },
          ),
        
          BlocConsumer<UpdateTaskBloc, UpdateTaskState>(
            listener: (context, state) {
              state.when(
                  loading: () {},
                  success: () {
                    context.read<GetAllTasksBloc>().add(
                          GetAllTasksEvent.getTasks(id: userId),
                        );
                    ShowToast.showToastSuccessTop(message: 'Task Completed');
                  },
                  error: (message) {
                    ShowToast.showToastErrorTop(message: message);
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return IconButton(
                  onPressed: () {
                    context.read<UpdateTaskBloc>().add(
                        UpdateTaskEvent.updateTasks(
                            taskId: id, body: UpdateTaskRequestBody(completed: true),));
                  },
                  icon: const Icon(
                    Icons.cloud_done_rounded,
                    color: Color(0xff9395D3),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
