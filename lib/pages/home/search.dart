import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
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
