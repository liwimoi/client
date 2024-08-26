import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:xard/home.dart';

void main() {
  runApp(MaterialApp(
    home: ChatView(),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late final WebSocketChannel _channel;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _channel = WebSocketChannel.connect(Uri.parse('ws://127.0.0.1:7777/ws'));
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat View"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint('pressed send button');
              _channel.sink.add(_controller.text.toString());
            },
            child: const Icon(Icons.send)),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                ),
                StreamBuilder(
                    stream: _channel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data);
                      } else {
                        return Container();
                      }
                    })
              ],
            )));
  }
}

// container
// -- wraps other widgets

// textfield and send button container
