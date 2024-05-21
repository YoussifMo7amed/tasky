import 'package:freezed_annotation/freezed_annotation.dart';
part'update_task_request_body.g.dart';
@JsonSerializable()
class UpdateTaskRequestBody {
final bool? completed;

  UpdateTaskRequestBody({
    this.completed,
  });

  Map<String, dynamic> toJson() => _$UpdateTaskRequestBodyToJson(this);
}
