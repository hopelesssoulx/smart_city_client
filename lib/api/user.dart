import 'package:smart_city_client/utils/request.dart';

// 用户登录
login(username, password) {
  return Request().rq.post('/user/login', data: {
    "username": username,
    "password": password,
  });
}

// 用户注册
register(username, password) {
  return Request().rq.post('/user/register', data: {
    "username": username,
    "password": password,
  });
}

// 查询用户信息
getUserInfo() {
  return Request().rq.get('/user/getUserInfo');
}

// 更新用户密码
updateUserPwd(oldPwd, newPwd) {
  return Request().rq.post('/user/updateUserPassword', data: {
    "oldPassword": oldPwd,
    "newPassword": newPwd,
  });
}

// 获取用户头像
getAvatar() {
  return ('http://192.168.137.1:3001/api/user/getAvatar/');
}

// 上传用户头像
updateAvatar(data) {
  return Request().rq.post('/user/uploadAvatar', data: data);
}
