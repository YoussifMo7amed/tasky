part of 'add_tasks_bloc.dart';

@freezed
class AddTasksEvent with _$AddTasksEvent {
  const factory AddTasksEvent.started() = _Started;
  const factory AddTasksEvent.addTasks({required AddTaskRequestBody body}) = AddTasks;

}