import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_city_client/api/user.dart';
import 'package:smart_city_client/utils/token.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var userInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: pickAvatar,
              child: SizedBox(
                width: screenHeight * 0.2,
                height: screenHeight * 0.2,
                child: CircleAvatar(
                  backgroundImage: const AssetImage(
                      'assets/images/default_user_avatar.webp'),
                  backgroundColor: Colors.white,
                  foregroundImage: NetworkImage(userInfo['avatar'] != null
                      ? getAvatar() + userInfo['avatar']
                      : ''),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.02),
              child: Text(
                userInfo['username'] ?? '',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.02),
              child: Text(
                userInfo['email'] ?? '',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  pickAvatar() async {
    final ImagePicker picker = ImagePicker();
    final XFile? avatar = await picker.pickImage(source: ImageSource.gallery);
    if (avatar == null) {
      return;
    }
    FormData formData = FormData.fromMap({
      "avatar":
          await MultipartFile.fromFile(avatar.path, filename: avatar.name),
    });
    updateAvatar(formData).then((r) => {
          if (r.data['status'] == 200)
            {
              Token.setAvatar(r.data['avatar']),
              init(),
            }
          else
            Fluttertoast.showToast(msg: r.data['msg']),
        });
  }

  init() {
    getUserInfo().then((r) => {
          setState(() {
            userInfo = r.data['data'][0];
          })
        });
  }
}
