part of 'update_task_bloc.dart';

@freezed
class UpdateTaskState with _$UpdateTaskState {
 const factory UpdateTaskState.loading() = _Loading;
  const factory UpdateTaskState.success() = _Success;
  const factory UpdateTaskState.error({required String message}) = _Error;}
