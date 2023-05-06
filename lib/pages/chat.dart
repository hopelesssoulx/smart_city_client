import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return const Text('chat.dart');
  }

  @override
  bool get wantKeepAlive => true;
}
