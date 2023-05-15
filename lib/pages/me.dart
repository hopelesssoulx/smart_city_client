import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/utils/token.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin {
  var username = '未登录';
  var uid = 'null';

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              height: 100,
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey[50],
                child: ListTile(
                  leading: const SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/default_user_avatar.webp'),
                      )),
                  title: Text(username),
                  subtitle: Text(
                    'uid: ' + uid,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent)),
                  onTap: () => {tap(0)},
                ),
              )),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('个人信息'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => {tap(1)},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('退出登录'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => {tap(2)},
          ),
        ],
      ),
    );
  }

  tap(event) {
    switch (event) {
      case 0:
        if (Token.getToken() == null) {
          Navigator.pushNamed(context, '/me/login').then((_) {
            setState(() {
              username = Token.getUsername()!;
              uid = Token.getUID()!;
            });
          });
        }
        break;
      case 1:
        print('个人信息');
        break;
      case 2:
        Token.rmAll();
        setState(() {
          username = '未登录';
          uid = 'null';
        });
        Fluttertoast.showToast(msg: '已退出登录');
        break;
    }
  }

  void init() {
    if (Token.getToken() != null) {
      username = Token.getUsername()!;
      uid = Token.getUID()!;
    }
  }
}
