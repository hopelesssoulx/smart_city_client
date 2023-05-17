import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:smart_city_client/api/news.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  var newsData = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    // final param = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: ListView(
        children: [
          Image.memory(base64Decode(newsData['cover'] != null
              ? newsData['cover'].split(',')[1]
              : 'R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7')),
          Text(newsData['title'] ?? ''),
          HtmlWidget(newsData['content'] ?? ''),
          Text(newsData['pub_date'] ?? ''),
        ],
      ),
    );
  }

  init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int id = ModalRoute.of(context)!.settings.arguments as int;
      getNewsDetail(id).then((r) => {
            setState(() {
              newsData = r.data['data'][0];
            }),
          });
    });
  }
}
