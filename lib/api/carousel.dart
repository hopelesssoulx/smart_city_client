import '../utils/request.dart';

getCarouselAddress() {
  return Request().rq.get('/carousel/getCarouselImages');
}

getCarouselImageBaseUrl() {
  return ('http://192.168.137.1:3001/api/carousel/getImages/');
}
