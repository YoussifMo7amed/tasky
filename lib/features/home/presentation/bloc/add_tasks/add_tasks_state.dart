part of 'add_tasks_bloc.dart';

@freezed
class AddTasksState with _$AddTasksState {
  const factory AddTasksState.initial() = _Initial;
    const factory AddTasksState.loading() = _LoadingState;
  const factory AddTasksState.success() = _SuccessState;
  const factory AddTasksState.error({required String error}) = _ErrorState;
}
