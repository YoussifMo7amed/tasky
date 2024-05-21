import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/service/Api/endpoints.dart';

import 'package:tasky/features/auth/data/models/login_request_body.dart';
import 'package:tasky/features/auth/data/models/login_responce.dart';
import 'package:tasky/features/home/data/model/add_task_request_body.dart';
import 'package:tasky/features/home/data/model/add_task_responce.dart';
import 'package:tasky/features/home/data/model/get_tasks_responce.dart';
import 'package:tasky/features/home/data/model/update_task_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequest);

  @GET('${EndPoints.userTodos}/{userId}')
  Future<GetAllTasksResponce> getAllTasks(@Path('userId') int userId);

  @POST(EndPoints.addTodo)
  Future<AddTaskResponce> addTodo(@Body() AddTaskRequestBody body);
  @PATCH('${EndPoints.updateTodos}/{TaskId}')
  Future<void> updateTasks(
      @Path('TaskId') int taskId, @Body() UpdateTaskRequestBody requestBody);

  @DELETE('${EndPoints.updateTodos}/{TaskId}')
  Future<void> deleteTask(@Path('TaskId') int taskId);
@GET(EndPoints.getAllTodos)
  Future<GetAllTasksResponce> fetchTasksWithPagination(
    @Query('limit') int limit,
    @Query('skip') int skip,
  );
}
