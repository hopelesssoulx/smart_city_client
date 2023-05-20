import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/api/user.dart';
import 'package:smart_city_client/utils/token.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin {
  var username = '未登录';
  var uid = 'null';
  var avatar = '';

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
                  leading: SizedBox(
                    width: 56,
                    height: 56,
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(
                          'assets/images/default_user_avatar.webp'),
                      backgroundColor: Colors.white,
                      foregroundImage: NetworkImage(avatar),
                    ),
                  ),
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
            leading: const Icon(Icons.update),
            title: const Text('修改密码'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => {tap(3)},
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
            refresh();
          });
        }
        break;
      case 1:
        Navigator.pushNamed(context, '/me/userInfo').then((_) {
          refresh();
        });
        break;
      case 3:
        Navigator.pushNamed(context, '/me/updatePwd');
        break;
      case 2:
        Token.rmAll();
        setState(() {
          username = '未登录';
          uid = 'null';
          avatar = '';
        });
        Fluttertoast.showToast(msg: '已退出登录', gravity: ToastGravity.CENTER);
        break;
    }
  }

  refresh() {
    setState(() {
      username = Token.getUsername()!;
      uid = Token.getUID()!;
      avatar = getAvatar() + Token.getAvatar()!;
    });
  }

  init() {
    if (Token.getToken() != null) {
      refresh();
    }
  }
}
