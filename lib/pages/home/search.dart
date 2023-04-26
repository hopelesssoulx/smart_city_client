import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'search.dart',
      ),
      onChanged: (value) => {
        debugPrint(value),
      },
      onSubmitted: (value) => {
        debugPrint(value),
      },
    );
  }
}
