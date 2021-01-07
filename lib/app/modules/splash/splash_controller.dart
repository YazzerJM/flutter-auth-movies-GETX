
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/repositories/local/local_auth_repository.dart';
import 'package:getx_pattern_demo/app/routes/app_routes.dart';

class SplashController extends GetxController {

  final LocalAuthRepository _localAuthRepository = Get.find<LocalAuthRepository>();
  
  @override
  void onReady() {
    _init();
    super.onReady();
  }

  _init() async {
    try {
      // await Future.delayed(Duration(seconds: 2));

      final RequestToken requestToken = await _localAuthRepository.session;
      if(requestToken != null){
        Get.offNamed(
          AppRoutes.HOME,
        );
      }else{
        Get.offNamed(
          AppRoutes.LOGIN,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}