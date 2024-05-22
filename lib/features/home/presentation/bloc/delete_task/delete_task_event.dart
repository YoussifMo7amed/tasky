part of 'delete_task_bloc.dart';

@freezed
class DeleteTaskEvent with _$DeleteTaskEvent {
  const factory DeleteTaskEvent.started() = _Started;
 const factory DeleteTaskEvent.deleteTask({required int taskId}) = DeleteTask;
 }