import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/home/data/model/update_task_request_body.dart';
import 'package:tasky/features/home/data/repo/home_repos.dart';

part 'update_task_event.dart';
part 'update_task_state.dart';
part 'update_task_bloc.freezed.dart';

class UpdateTaskBloc extends Bloc<UpdateTaskEvent, UpdateTaskState> {
  UpdateTaskBloc(this._repo) : super(const _Loading()) {
    on<UpdateTasks>(_updateTask);
  }
  final HomeRepos _repo;
  FutureOr<void> _updateTask(
      UpdateTasks event, Emitter<UpdateTaskState> emit) async {
    emit(const UpdateTaskState.loading());
    final result = await _repo.updateTask(event.taskId, event.body);
    result.when(
        success: (success) =>
            emit(const UpdateTaskState.success()),
        failure: (failure) => emit(UpdateTaskState.error(message: failure)));
  }
}
