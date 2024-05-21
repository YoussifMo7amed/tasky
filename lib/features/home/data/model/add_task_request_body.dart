import 'package:freezed_annotation/freezed_annotation.dart';
 part'add_task_request_body.g.dart';
@JsonSerializable()
class AddTaskRequestBody {
  final String? todo;
 final String? completed;
 final int ?userId;
  AddTaskRequestBody({
    this.todo,
    this.completed,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$AddTaskRequestBodyToJson(this);
}