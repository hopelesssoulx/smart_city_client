import 'package:flutter/material.dart';

class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return const Text('apps.dart');
  }

  @override
  bool get wantKeepAlive => true;
}
