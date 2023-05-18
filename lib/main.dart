import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_city_client/components/error_page.dart';
import 'package:smart_city_client/pages/Home.dart';
import 'package:smart_city_client/pages/apps.dart';
import 'package:smart_city_client/pages/chat.dart';
import 'package:smart_city_client/pages/me.dart';
import 'package:smart_city_client/pages/smart_City.dart';
import 'package:smart_city_client/utils/router.dart';
import 'package:smart_city_client/utils/token.dart';

Future<void> main() async {
  await Token.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RouteManager router = RouteManager();

    return MaterialApp(
      title: 'smart_city_client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      initialRoute: '/',
      onGenerateRoute: (setting) {
        return router.routeWithSetting(setting);
      },
      onUnknownRoute: (setting) {
        return router.unknowRouteWithSetting(setting);
      },
      builder: (context, widget) {
        ErrorWidget.builder = (FlutterErrorDetails e) {
          return ErrorPage(errorDetails: e);
        };
        return widget!;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: Colors.black),
          height: 100,
          child: const TabBar(
            labelStyle: TextStyle(
              height: 0,
              fontSize: 16,
            ),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: ("首页"),
              ),
              Tab(
                icon: Icon(Icons.apps),
                text: ("应用"),
              ),
              Tab(
                icon: Icon(Icons.location_city),
                text: ("智慧城市"),
              ),
              Tab(
                icon: Icon(Icons.message),
                text: ("聊天"),
              ),
              Tab(
                icon: Icon(Icons.person),
                text: ("我的"),
              ),
            ],
          ),
        ),
        body: Container(
          // padding: EdgeInsets.only(
          //     top: MediaQueryData.fromWindow(window).padding.top),
          child: const TabBarView(
            children: <Widget>[
              Home(),
              Apps(),
              SmartCity(),
              Chat(),
              Me(),
            ],
          ),
        ),
      ),
    );
  }
}
