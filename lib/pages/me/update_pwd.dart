import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/api/user.dart';
import 'package:smart_city_client/utils/token.dart';

class UpdatePwd extends StatefulWidget {
  const UpdatePwd({super.key});

  @override
  State<UpdatePwd> createState() => _UpdatePwdState();
}

class _UpdatePwdState extends State<UpdatePwd> {
  var ctrlold = TextEditingController();
  var ctrlNew1 = TextEditingController();
  var ctrlNew2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('修改密码 '),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              obscureText: true,
              controller: ctrlold,
              decoration: const InputDecoration(hintText: '旧密码'),
            ),
            TextField(
              obscureText: true,
              controller: ctrlNew1,
              decoration: const InputDecoration(hintText: '新密码'),
            ),
            TextField(
              obscureText: true,
              controller: ctrlNew2,
              decoration: const InputDecoration(hintText: '重复新密码'),
            ),
            ElevatedButton(onPressed: update, child: const Text('修改'))
          ],
        ),
      ),
    );
  }

  update() {
    if (ctrlNew1.text != ctrlNew2.text) {
      Fluttertoast.showToast(msg: '两次输入的密码不一致', gravity: ToastGravity.CENTER);
    } else {
      updateUserPwd(ctrlold.text, ctrlNew2.text).then((r) => {
            if (r.data['code'] == 200)
              {
                login(Token.getUsername(), ctrlNew2.text).then((r) => {
                      Token.setToken(r.data['token']),
                    }),
                Navigator.of(context).pop(),
                Fluttertoast.showToast(
                    msg: r.data['msg'], gravity: ToastGravity.CENTER),
              }
          });
    }
  }
}
