
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';

class LocalAuth {

  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();
  // final FirebaseAuthentication _authStorage = Get.find<FirebaseAuthentication>();

  static const KEY = "session";

  Future<void> setSession(RequestToken requestToken) async {
    await _storage.write(
      key: KEY, 
      value: jsonEncode(requestToken.toJson())
    );
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<RequestToken> getSession() async {
    final String data = await _storage.read(key: KEY);

    if(data != null){
      final RequestToken requestToken = RequestToken.fromJson(json.decode(data));
      if(DateTime.now().isBefore(requestToken.expiresAt)){
        return requestToken;
      }
      return null;
    }
    
    return null;
  }
}