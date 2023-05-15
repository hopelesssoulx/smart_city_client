import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/api/user.dart';
import 'package:smart_city_client/utils/token.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: const InputDecoration(hintText: '账号'),
            ),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(hintText: '密码'),
            ),
            ElevatedButton(onPressed: loginButton, child: const Text('登录'))
          ],
        ),
      ),
    );
  }

  loginButton() {
    login(
      usernameCtrl.text,
      passwordCtrl.text,
    ).then(
      (r) => {
        if (r.data['code'] == 200)
          {
            Token.setAll(r.data),
            Navigator.of(context).pop(),
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
