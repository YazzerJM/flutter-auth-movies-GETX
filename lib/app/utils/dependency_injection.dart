import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/providers/local/local_auth.dart';
// import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/authentication_api.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/movies_api.dart';
import 'package:getx_pattern_demo/app/data/repositories/local/local_auth_repository.dart';
import 'package:getx_pattern_demo/app/data/repositories/remote/authentication_repository.dart';
import 'package:getx_pattern_demo/app/data/repositories/remote/movies_repository.dart';

// class MockAuthenticationAPI implements AuthenticationAPI {
//   @override
//   Future<RequestToken> newRequestToken() {
//   }
// }

class DependencyInjection {

  static void init(){

    // Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(), fenix: true);
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());

    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')));

    // PROVIDERS
    Get.put<AuthenticationAPI>(AuthenticationAPI());
    Get.put<MoviesAPI>(MoviesAPI());
    
    Get.put<LocalAuth>(LocalAuth());

    // REPOSITORIES
    Get.put<AuthenticationRepository>(AuthenticationRepository());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<MoviesRepository>(MoviesRepository());
  }
}