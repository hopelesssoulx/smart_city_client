import 'package:flutter/material.dart';
import 'package:smart_city_client/pages/home/carousel.dart';
import 'package:smart_city_client/pages/home/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text('home.dart'),
        Search(),
        Carousel(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
