part of 'delete_task_bloc.dart';

@freezed
class DeleteTaskState with _$DeleteTaskState {
 const factory DeleteTaskState.loading() = _Loading;
  const factory DeleteTaskState.success() = _Success;
  const factory DeleteTaskState.error({required String message}) = _Error;}
