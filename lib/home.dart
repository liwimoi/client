import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatroom"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Text("Hello")
    );
  }
}