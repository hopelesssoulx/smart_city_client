import 'package:flutter/material.dart';
import 'package:smart_city_client/pages/me/login.dart';
import 'package:smart_city_client/pages/me/register.dart';

class RouteManager {
  // 路由总表
  Map<String, WidgetBuilder> _routeMap = {};

  RouteManager() {
    _routeMap.addAll(me());
  }

  // 自定义路由
  MaterialPageRoute routeWithSetting(RouteSettings setting) {
    WidgetBuilder? builder = _routeMap[setting.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 未知路由
  MaterialPageRoute unknowRouteWithSetting(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) => Scaffold());
  }

  // 我的
  Map<String, WidgetBuilder> me() {
    return {
      "/me/login": (BuildContext context) => const Login(),
      "/me/register": (BuildContext context) => const Register(),
    };
  }
}
