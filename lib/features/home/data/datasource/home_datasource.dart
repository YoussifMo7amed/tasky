import 'package:tasky/core/service/Api/api_service.dart';
import 'package:tasky/features/home/data/model/add_task_request_body.dart';
import 'package:tasky/features/home/data/model/add_task_responce.dart';
import 'package:tasky/features/home/data/model/get_tasks_responce.dart';
import 'package:tasky/features/home/data/model/update_task_request_body.dart';

class HomeDataSource {
  HomeDataSource(this._api);

  final ApiService _api;

  Future<GetAllTasksResponce> getAllTasks( int userId ) async {
    final response =
        await _api.getAllTasks(userId);
    return response;
  }
  Future<AddTaskResponce> addTasks(AddTaskRequestBody body) async {
    final response =
        await _api.addTodo(body);
    return response;
  }
  Future<void> updateTask(int taskId, UpdateTaskRequestBody requestBody) async {
    final response =
        await _api.updateTasks(taskId, requestBody);
    return response;
  }
  Future<void> deleteTask(int taskId) async {
  final response = await _api.deleteTask(taskId);
  return response;
}
 Future<GetAllTasksResponce> getTasksWithPagination(int limit,int skip) async {
    final response =
        await _api.fetchTasksWithPagination(
          limit,
          skip,
        );
    return response;
  }

}