part of 'get_all_tasks_bloc.dart';

@freezed
class GetAllTasksEvent with _$GetAllTasksEvent {
  const factory GetAllTasksEvent.started() = _Started;
  const factory GetAllTasksEvent.getTasks({
    required int id,
  }) = GetTasks;
}