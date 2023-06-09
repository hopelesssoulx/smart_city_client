import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_city_client/api/news.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.title});

  final String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var newsData = [];
  var newsCate = <int, String>{};

  @override
  void initState() {
    super.initState();

    print('on receive: ' + widget.title);
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索结果'),
      ),
      body: ListView(
        children: [
          for (int index = 0; index < newsData.length; index++) _newsView(index)
        ],
      ),
    );
  }

  Widget _newsView(index) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const NewsDetail();
        //     },
        //     settings: RouteSettings(
        //         arguments: newsData[index]['id'],
        //         ),
        //   ),
        // );
        Navigator.pushNamed(
          context,
          '/home/newsDetail',
          arguments: newsData[index]['id'],
        );
      },
      child: Card(
        child: Row(
          children: [
            Container(
              height: 120,
              padding: EdgeInsets.all(screenWidth * 0.03),
              width: screenWidth * 0.65,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        newsData[index]['title'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            newsCate[newsData[index]['type']]!,
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          Text('        '),
                          Text(
                            newsData[index]['pub_date'],
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      minHeight: 100,
                      maxWidth: 100,
                      maxHeight: 100,
                    ),
                    child: Image.memory(
                        base64Decode(newsData[index]['cover'].split(',')[1]),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  init() {
    getNewsList(title: widget.title).then((r) => {
          setState(() {
            newsData = r.data['data'];
          })
        });
    getNewsCategory().then((r) => {
          setState(() {
            r.data['data'].forEach((i) {
              newsCate[i['id']] = i['news_category'];
            });
          }),
        });
  }
}
