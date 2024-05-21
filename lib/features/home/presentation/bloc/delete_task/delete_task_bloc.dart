import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/home/data/repo/home_repos.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';
part 'delete_task_bloc.freezed.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  DeleteTaskBloc(this._repo) : super(const _Loading()) {
    on<DeleteTask>(_deleteTasks); // Add this handler for the delete task event
  }

  FutureOr<void> _deleteTasks(DeleteTask event,Emitter<DeleteTaskState > emit)async {
      emit(const DeleteTaskState.loading());
      final result = await _repo.deleteTask(event.taskId);
      result.when(
          success: (success) => emit(const DeleteTaskState.success()),
          failure: (failure) => emit(DeleteTaskState.error(message: failure)));
  }
  final HomeRepos _repo;


}

