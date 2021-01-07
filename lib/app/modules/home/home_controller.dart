import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/movie.dart';
import 'package:getx_pattern_demo/app/data/repositories/local/local_auth_repository.dart';
import 'package:getx_pattern_demo/app/data/repositories/remote/movies_repository.dart';
import 'package:getx_pattern_demo/app/routes/app_routes.dart';

class HomeController extends GetxController {

  final LocalAuthRepository _localAuthRepository = Get.find<LocalAuthRepository>();
  final MoviesRepository _moviesRepository = Get.find<MoviesRepository>();

  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();
    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
  }

  Future<void> _loadMovies() async {
    try {
      this._movies = await _moviesRepository.getTopMovies();
      print("MOVIES:::: ${_movies.length}");
      update();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReady() {
    _loadMovies();
    super.onReady();
  }
}