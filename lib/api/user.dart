import 'package:smart_city_client/utils/request.dart';

login(username, password) {
  return Request().dio.post('/user/login', data: {
    "username": username,
    "password": password,
  });
}

register(username, password) {
  return Request().dio.post('/user/register', data: {
    "username": username,
    "password": password,
  });
}
