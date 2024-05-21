
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_tasks_responce.g.dart';
@JsonSerializable()
class GetAllTasksResponce {
  GetAllTasksResponce({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });
  late final List<Data> todos;
  late final int total;
  late final int skip;
  late final int limit;

  factory GetAllTasksResponce.fromJson(Map<String, dynamic> json) =>
      _$GetAllTasksResponceFromJson(json);
}

@JsonSerializable()
class Data {
  Data({
    required this.id,
    required this.todo,
    required this.completed,
    });

  late final int id;
  late final String todo;
  late final bool completed;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}


