import 'package:flutter/material.dart';

class SmartCity extends StatefulWidget {
  const SmartCity({super.key});

  @override
  State<SmartCity> createState() => _SmartCityState();
}

class _SmartCityState extends State<SmartCity>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return const Text('smart_city.dart');
  }

  @override
  bool get wantKeepAlive => true;
}
