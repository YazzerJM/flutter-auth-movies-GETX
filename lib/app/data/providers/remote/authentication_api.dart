
import 'package:meta/meta.dart' show required;
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

class AuthenticationAPI {
  
  final Dio.Dio _dio = Get.find<Dio.Dio>();

  Future<RequestToken> newRequestToken() async {
    final Dio.Response response = await _dio.get(
      '/authentication/token/new', 
      queryParameters: {
        "api_key" : Constants.THE_MOVIEDB_API_KEY,
      }
    );

    return RequestToken.fromJson(response.data);
  }


  Future<RequestToken> validateWithLogin({
    @required String username, 
    @required String password, 
    @required String requestToken
  
  }) async {

    final Dio.Response response = await _dio.post(
      '/authentication/token/validate_with_login', 
      queryParameters: {
        "api_key" : Constants.THE_MOVIEDB_API_KEY,
      },
      data: {
        "username" : username,
        "password" : password,
        "request_token" : requestToken
      },
    );

    return RequestToken.fromJson(response.data);
  }
}