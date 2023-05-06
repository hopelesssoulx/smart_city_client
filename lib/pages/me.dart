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
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => {username = value},
          ),
          Padding(padding: EdgeInsets.only(bottom: 40)),
          TextField(
            onChanged: (value) => {password = value},
          ),
          Padding(padding: EdgeInsets.only(bottom: 40)),
          ElevatedButton(onPressed: sendRequest, child: Text('login')),
          ElevatedButton(onPressed: show, child: Text('show')),
        ],
      ),
    );
  }

  show() {
    debugPrint(Token.getToken());
    debugPrint(Token.getUsername());
  }

  sendRequest() {
    login(
      username,
      password,
    ).then(
      (r) => {
        // print(r.data),
        if (r.data['code'] == 200)
          {
            Token.setToken(r.data['token']),
            Token.setUsername(r.data['username']),
            Fluttertoast.showToast(msg: r.data['msg']),
          }
        else
          {
            Fluttertoast.showToast(msg: r.data['msg']),
          }
      },
    );
  }
}
