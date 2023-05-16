import 'package:smart_city_client/utils/request.dart';

// 获取新闻分类
getNewsCategory() {
  return Request().rq.get('/news/getNewsCategory');
}

// 获取新闻列表
getNewsList() {
  return Request().rq.get('/news/getNewsList?type=20');
}

// 获取新闻详情
getNewsDetail(id) {
  return Request().rq.get('/news/getNewsDetail/$id');
}
