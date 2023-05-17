import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city_client/pages/home/search_page.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    var searchCtrl = TextEditingController();

    return TextField(
      controller: searchCtrl,
      decoration: InputDecoration(
        hintText: '搜索',
        prefixIcon: Icon(Icons.search),
        suffixIcon:
            IconButton(onPressed: searchCtrl.clear, icon: Icon(Icons.close)),
      ),
      onSubmitted: (value) => {
        if (value == '')
          {Fluttertoast.showToast(msg: '关键词不能为空', gravity: ToastGravity.TOP)}
        else
          {
            searchCtrl.clear(),
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchPage(
                    title: value,
                  );
                },
              ),
            ),
          }
      },
    );
  }
}
