import "package:flutter/material.dart";
import "package:socket_app/home.dart";
import "package:web_socket_channel/io.dart";
void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(channel: IOWebSocketChannel.connect("ws://echo.websocket.org"))
    );
  }
}

