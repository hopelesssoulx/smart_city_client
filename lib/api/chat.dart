import 'package:smart_city_client/utils/request.dart';

getChat() {
  return 'http://192.168.137.1:3001/api/chat/getChat';
}

postChat(msg) {
  return Request().rq.post('/chat/postChat', data: {
    "msg": msg,
  });
}
