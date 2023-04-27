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

  static void setUsername(String username) {
    prefs.setString('username', username);
  }

  static String? getUsername() {
    return prefs.getString(username);
  }

  static void setToken(String token) {
    prefs.setString('token', token);
  }

  static String? getToken() {
    return prefs.getString(token);
  }
}
