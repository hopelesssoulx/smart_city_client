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
        for (int index = 0; index < newsData.length; index++) _newsView(index)
      ],
    );
  }

  Widget _newsView(index) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        print(newsData[index]['id']);
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