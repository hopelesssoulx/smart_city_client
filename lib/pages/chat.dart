import 'package:flutter/material.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:smart_city_client/api/chat.dart';
import 'package:smart_city_client/utils/token.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with AutomaticKeepAliveClientMixin {
  var postController = TextEditingController();
  var chatsController = ScrollController();
  var sseClient;
  var initText = 'loading';
  var postMsg = '';
  List<Text> chats = [];

  @override
  void initState() {
    super.initState();

    initChat();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _chatsView(),
        ),
        Row(
          children: [
            SizedBox(
              width: 320,
              child: TextField(
                controller: postController,
                decoration: const InputDecoration(hintText: '输入'),
                onChanged: (val) => {
                  setState(() {
                    postMsg = val;
                  }),
                },
                onSubmitted: (val) => {
                  post(),
                },
              ),
            ),
            ElevatedButton(onPressed: post, child: const Text('发送')),
          ],
        ),
      ],
    );
  }

  Widget _chatsView() {
    return ListView.builder(
      controller: chatsController,
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: chats[index],
        );
      },
    );
  }

  initChat() {
    var token = Token.getToken() ?? '';
    sseClient = SSEClient.subscribeToSSE(url: getChat(), header: {
      "Authorization": token,
      "Accept": "text/event-stream",
      "Cache-Control": "no-cache",
    });

    sseClient.listen((event) {
      // print('Id: ' + event.id!);
      // print('Event: ' + event.event!);
      // print('Data: ' + event.data!);
      final text = Text(event.data!);
      setState(() {
        chats.add(text);
      });
      chatsController.animateTo(
        chatsController.position.maxScrollExtent + 36,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  post() {
    if (postMsg != '') {
      postChat(postMsg);
      postController.clear();
      postMsg = '';
    }
  }
}
