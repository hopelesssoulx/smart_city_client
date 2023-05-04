import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/utils/token.dart';

class Request {
  Dio rq = Dio(
    BaseOptions(
      // baseUrl: 'http://127.0.0.1:3001',
      baseUrl: 'http://192.168.137.1:3001/api',
    ),
  );

  Request() {
    rq.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => {
        options.headers["Authorization"] = Token.getToken(),
        handler.next(options)
      },
      onResponse: (e, handler) => {
        handler.next(e),
      },
      onError: (e, handler) => {
        print('----------------onError----------------'),
        print(e),
        print('----------------onError----------------'),
        Fluttertoast.showToast(msg: 'unexpected error'),
        handler.next(e),
      },
    ));
  }
}
