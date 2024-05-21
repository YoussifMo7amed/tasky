import 'package:freezed_annotation/freezed_annotation.dart';
  part'add_task_responce.g.dart';
@JsonSerializable()
class AddTaskResponce{
  AddTaskResponce({ this.todo, this.completed,  this.id});
 final int? id;
 final String? todo;
 final String? completed;

  factory AddTaskResponce.fromJson(Map<String, dynamic> json)  => _$AddTaskResponceFromJson(json);

}