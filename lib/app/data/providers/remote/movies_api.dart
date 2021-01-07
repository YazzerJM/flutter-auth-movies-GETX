
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/movie.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

class MoviesAPI {

  final Dio.Dio _dio = Get.find<Dio.Dio>();

  Future<List<Movie>> getTopMovies() async {
    final Dio.Response response = await _dio.get(
      '/movie/top_rated', 
      queryParameters: {
        "api_key" : Constants.THE_MOVIEDB_API_KEY,
        "language": "es"
      }
    );

    return (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
  }

}