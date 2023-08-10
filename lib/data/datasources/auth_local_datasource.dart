import 'dart:convert';

import 'package:e_commerce_electronics/data/models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<bool> saveAuthData(AuthResponseModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final result = await pref.setString('auth', jsonEncode(model.toJson()));
    return result;
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('auth');
  }

  Future<String> getToken() async {
    final SharedPreferences pref =
        await SharedPreferences.getInstance(); //load data pref
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    print(authJson);
    return authData.jwt;
  }

  Future<User> getUser() async {
    final SharedPreferences pref =
        await SharedPreferences.getInstance(); //load data pref
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    print(authJson);
    return authData.user;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth');
    return authJson != null;
  }
}
