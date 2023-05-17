import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_city_client/api/news.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  var newsCate = <int, String>{};
  var newsData = [];

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            // children: [for (int i = 0; i < 10; i++) _cate(i)],
            children: [for (int k in newsCate.keys) _cate(k)],
          ),
        ),
        for (int index = 0; index < newsData.length; index++) _newsView(index)
      ],
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

  Widget _cate(index) {
    return TextButton(
      onPressed: () => {changeCate(index)},
      child: Text(
        newsCate[index]!,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  changeCate(index) {
    getNewsList(type: index).then((r) => {
          setState(() {
            newsData = r.data['data'];
          }),
        });
  }

  init() {
    getNewsList().then((r) => {
          setState(() {
            newsData = r.data['data'];
          }),
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
