part of 'get_tasks_with_pagination_bloc.dart';

@freezed
class GetTasksWithPaginationEvent with _$GetTasksWithPaginationEvent {
  const factory GetTasksWithPaginationEvent.started() = _Started;
  const factory GetTasksWithPaginationEvent.getTasksWithPagination({
    required int limit,
    required int skip,

  }) = GetNewTasksWithPagination;
}