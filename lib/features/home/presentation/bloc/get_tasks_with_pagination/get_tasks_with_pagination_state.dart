part of 'get_tasks_with_pagination_bloc.dart';

@freezed
class GetTasksWithPaginationState with _$GetTasksWithPaginationState {
  const factory GetTasksWithPaginationState.loading() = Loading;
  const factory GetTasksWithPaginationState.success({required GetAllTasksResponce response}) = _Success;
    const factory GetTasksWithPaginationState.empty() =
      _Empty;
  const factory GetTasksWithPaginationState.error({required String message}) = _Error;}
