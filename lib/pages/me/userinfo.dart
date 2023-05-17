import 'package:flutter/material.dart';
import 'package:smart_city_client/api/user.dart';

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
            Container(
              height: screenHeight * 0.2,
              child: ClipOval(
                child: Image.asset('assets/images/default_user_avatar.webp'),
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

  init() {
    getUserInfo().then((r) => {
          print(r),
          setState(() {
            userInfo = r.data['data'][0];
          })
        });
  }
}
