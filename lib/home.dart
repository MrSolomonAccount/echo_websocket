import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MyHomePage extends StatefulWidget {
  final WebSocketChannel channel;
  const MyHomePage({super.key,required this.channel});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    widget.channel.sink.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: const Text("Echo Websocket"), centerTitle: true,),
body: Form(child: Column(children: [
TextFormField(decoration: const InputDecoration(labelText: "You say "),
controller: controller,
),
StreamBuilder(stream: widget.channel.stream, 

builder: (_, snapshot){
  return Text(snapshot.hasData?"The server says ${snapshot.data}":"no data received");
}),



],)),
floatingActionButton:FloatingActionButton(onPressed: (){
if(controller.text.isNotEmpty){
  //sends data to the websocket server
  widget.channel.sink.add(controller.text);
}
else {
  // reminds the user to write something in the textformfield
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You must say something")));
}
}, child:const Icon(Icons.send),)
    );
  }
}