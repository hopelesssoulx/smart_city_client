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
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.alternate_email),
              title: TextField(
                controller: usernameCtrl,
                decoration: const InputDecoration(hintText: '账号'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: TextField(
                controller: passwordCtrl,
                decoration: const InputDecoration(hintText: '密码'),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: toRegister,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: const Text('注册'),
                ),
                const Padding(padding: EdgeInsets.only(left: 30)),
                ElevatedButton(
                  onPressed: loginButton,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: const Text('登录'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  toRegister() {
    Navigator.pushNamed(context, '/me/register');
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
