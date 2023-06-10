import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/api/user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
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
                  onPressed: registerButton,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: const Text('注册'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  registerButton() {
    register(
      usernameCtrl.text,
      passwordCtrl.text,
    ).then(
      (r) => {
        if (r.data['code'] == 200)
          {
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
