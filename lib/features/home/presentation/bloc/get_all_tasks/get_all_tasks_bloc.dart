import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/home/data/model/get_tasks_responce.dart';
import 'package:tasky/features/home/data/repo/home_repos.dart';

part 'get_all_tasks_event.dart';
part 'get_all_tasks_state.dart';
part 'get_all_tasks_bloc.freezed.dart';

class GetAllTasksBloc extends Bloc<GetAllTasksEvent, GetAllTasksState> {
  GetAllTasksBloc(this._reop,) : super(const _Loading()) {
    on<GetTasks>(_getTasks);
  }
  final HomeRepos _reop;

  FutureOr<void> _getTasks(
      GetTasks event, Emitter<GetAllTasksState> emit) async {
       
    emit(const GetAllTasksState.loading());
    final result = await _reop.getAllTasks(event.id);
    result.when(
        success: (success) => emit(GetAllTasksState.success(response: success)),
        failure: (failure) => emit(GetAllTasksState.error(message: failure)));
  }
}
