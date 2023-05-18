import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/pages/home/news_detail.dart';
import 'package:smart_city_client/pages/me/login.dart';
import 'package:smart_city_client/pages/me/register.dart';
import 'package:smart_city_client/pages/me/update_pwd.dart';
import 'package:smart_city_client/pages/me/userinfo.dart';
import 'package:smart_city_client/utils/token.dart';

class RouteManager {
  // 路由总表
  Map<String, WidgetBuilder> _routeMap = {};

  RouteManager() {
    _routeMap.addAll(home());
    _routeMap.addAll(me());
  }

  // 自定义路由
  MaterialPageRoute routeWithSetting(RouteSettings setting) {
    WidgetBuilder? builder = _routeMap[setting.name];
    if (authPath.contains(setting.name)) {
      if (Token.getToken() == null) {
        Fluttertoast.showToast(msg: '未登录', gravity: ToastGravity.CENTER);
        return MaterialPageRoute(
            builder: (context) {
              return Login();
            },
            settings: setting);
      }
    }
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: setting);
    }
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 未知路由
  MaterialPageRoute unknowRouteWithSetting(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 需要登录
  final authPath = ["/me/userInfo", "/me/updatePwd"];

  // 我的
  Map<String, WidgetBuilder> home() {
    return {
      "/home/newsDetail": (BuildContext context) => const NewsDetail(),
    };
  }

  // 我的
  Map<String, WidgetBuilder> me() {
    return {
      "/me/login": (BuildContext context) => const Login(),
      "/me/register": (BuildContext context) => const Register(),
      "/me/userInfo": (BuildContext context) => const UserInfo(),
      "/me/updatePwd": (BuildContext context) => const UpdatePwd(),
    };
  }
}
