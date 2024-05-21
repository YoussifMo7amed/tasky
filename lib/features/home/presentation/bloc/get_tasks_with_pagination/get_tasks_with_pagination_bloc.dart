import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky/features/home/data/model/get_tasks_responce.dart';
import 'package:tasky/features/home/data/repo/home_repos.dart';

part 'get_tasks_with_pagination_event.dart';
part 'get_tasks_with_pagination_state.dart';
part 'get_tasks_with_pagination_bloc.freezed.dart';

class GetTasksWithPaginationBloc extends Bloc<GetTasksWithPaginationEvent, GetTasksWithPaginationState> {
  GetTasksWithPaginationBloc(this._repo) : super(const Loading()) {
    on<GetNewTasksWithPagination>(_getTaskswithPagination);
  }
  final HomeRepos _repo;

  FutureOr<void> _getTaskswithPagination(GetNewTasksWithPagination event,Emitter<GetTasksWithPaginationState> emit)async {
    emit(const GetTasksWithPaginationState.loading());
    final result = await _repo.getTasksWithPagination(event.limit,event.skip);
    result.when(
        success: (success) => emit(GetTasksWithPaginationState.success(response: success)),
        failure: (failure) => emit(GetTasksWithPaginationState.error(message: failure)));
    
  }
}
