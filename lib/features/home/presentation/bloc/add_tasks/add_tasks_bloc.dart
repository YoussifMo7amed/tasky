import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/home/data/model/add_task_request_body.dart';
import 'package:tasky/features/home/data/repo/home_repos.dart';

part 'add_tasks_event.dart';
part 'add_tasks_state.dart';
part 'add_tasks_bloc.freezed.dart';

class AddTasksBloc extends Bloc<AddTasksEvent, AddTasksState> {
  AddTasksBloc(this._repo) : super(const _Initial()) {
    on<AddTasks>(_addTasks);
  }
  final HomeRepos _repo;
  FutureOr<void> _addTasks(AddTasks event, Emitter<AddTasksState> emit) async {
    emit(const AddTasksState.loading());
    final result = await _repo.addTasks(event.body);
    result.when(
        success: (success) => emit(const AddTasksState.success()),
        failure: (failure) => emit(AddTasksState.error(error: failure)));
  }
}
