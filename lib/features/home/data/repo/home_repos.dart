import 'package:tasky/core/service/Api/api_result.dart';
import 'package:tasky/features/home/data/datasource/home_datasource.dart';
import 'package:tasky/features/home/data/model/add_task_request_body.dart';
import 'package:tasky/features/home/data/model/add_task_responce.dart';
import 'package:tasky/features/home/data/model/get_tasks_responce.dart';
import 'package:tasky/features/home/data/model/update_task_request_body.dart';

class HomeRepos {
  HomeRepos(this._dataSource);

  final HomeDataSource _dataSource;
  Future<ApiResult<GetAllTasksResponce>> getAllTasks(int userId) async {
    try {
      final response = await _dataSource.getAllTasks(userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<AddTaskResponce>> addTasks(AddTaskRequestBody body) async {
    try {
      final response = await _dataSource.addTasks(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
  Future <ApiResult<void>> updateTask(int taskId, UpdateTaskRequestBody requestBody) async {
    try {
      final response = await _dataSource.updateTask(taskId, requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
  Future<ApiResult<void>> deleteTask(int taskId) async {
  try {
    final response = await _dataSource.deleteTask(taskId);
    return ApiResult.success(response);
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}
 Future<ApiResult<GetAllTasksResponce>> getTasksWithPagination(int limit,int skip) async {
    try {
      final response = await _dataSource.getTasksWithPagination(limit,skip);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
