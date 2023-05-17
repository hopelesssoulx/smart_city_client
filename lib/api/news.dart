import 'package:smart_city_client/utils/request.dart';

// 获取新闻分类
getNewsCategory() {
  return Request().rq.get('/news/getNewsCategory');
}

// 获取新闻列表
getNewsList({title, type}) {
  if (title != null) {
    return Request().rq.get('/news/getNewsList?title=$title');
  }
  if (type != null) {
    return Request().rq.get('/news/getNewsList?type=$type');
  }
  return Request().rq.get('/news/getNewsList');
}

// 获取新闻详情
getNewsDetail(id) {
  return Request().rq.get('/news/getNewsDetail/$id');
}
