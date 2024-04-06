import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState  createState() => _ChatState();
}

class  _ChatState extends State<Chat> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: const Center(
        child: Text('Message',style:TextStyle(fontSize: 40)),
       ),
     );
     }
}