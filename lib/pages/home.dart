import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smart_city_client/pages/home/carousel.dart';
import 'package:smart_city_client/pages/home/search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('home.dart'),
          Search(),
          Carousel(),
        ],
      ),
    );
  }
}
