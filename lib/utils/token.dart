import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Token {
//   SharedPreferences prefs = SharedPreferences.getInstance();

//   setToken(token) async {
//     prefs.setString('token', token);
//   }

//   getToken() async {
//     return (prefs.getString('token'));
//   }
// }

class Token {
  static const String username = 'username'; //用户名
  static const String token = 'token'; //token
  static late SharedPreferences prefs; //延迟初始化

  static Future<String> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();

    return 'ok';
  }

  static void setToken(String token) {
    prefs.setString('token', token);
  }

  static String? getToken() {
    return prefs.getString(token);
  }

  static void setUsername(String username) {
    prefs.setString('username', username);
  }

  static String? getUsername() {
    return prefs.getString(username);
  }

  static void setUID(String uid) {
    prefs.setString('uid', uid);
  }

  static String? getUID() {
    return prefs.getString('uid');
  }

  static void setAvatar(String avatar) {
    prefs.setString('avatar', avatar);
  }

  static String? getAvatar() {
    return prefs.getString('avatar');
  }

  static void rmAll() {
    prefs.remove('token');
    prefs.remove('username');
    prefs.remove('uid');
    prefs.remove('avatar');
  }

  static void setAll(data) {
    prefs.setString('token', data['token']);
    prefs.setString('username', data['username']);
    prefs.setString('uid', data['id'].toString());
    prefs.setString('avatar', data['avatar'] ?? '');
  }
}
