import 'package:dio/dio.dart';
import 'package:nextdaysolution_task/models/user_response.dart';

class ApiHelper {
  static const String endpoint = 'https://reqres.in/api/users?page=1';

  static Future<UserResponse> getPersonData() async {
    Response response = await Dio().get(endpoint);
    return UserResponse.fromJson(response.data);
  }
}
