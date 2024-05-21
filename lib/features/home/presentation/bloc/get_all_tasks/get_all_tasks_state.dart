part of 'get_all_tasks_bloc.dart';

@freezed
class GetAllTasksState with _$GetAllTasksState {
  const factory GetAllTasksState.loading() = _Loading;
  const factory GetAllTasksState.success({required GetAllTasksResponce response}) = _Success;
    const factory GetAllTasksState.empty() =
      _GetAllTasksState;
  const factory GetAllTasksState.error({required String message}) = _Error;
}
