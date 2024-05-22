// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tasks_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTasksResponce _$GetAllTasksResponceFromJson(Map<String, dynamic> json) =>
    GetAllTasksResponce(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );


Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num).toInt(),
      todo: json['todo'] as String,
      completed: json['completed'] as bool,
    );

