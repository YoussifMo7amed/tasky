part of 'update_task_bloc.dart';

@freezed
class UpdateTaskEvent with _$UpdateTaskEvent {
  const factory UpdateTaskEvent.started() = _Started;
  const factory UpdateTaskEvent.updateTasks({required int taskId,required UpdateTaskRequestBody body}) = UpdateTasks;
}