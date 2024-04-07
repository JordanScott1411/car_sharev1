import 'package:flutter/material.dart';

class PostTra extends StatefulWidget{
  const PostTra({super.key});

  @override 
  _PostTraState createState() =>_PostTraState();
}

class _PostTraState extends State<PostTra> {
   @override 
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Publier un trajet', style: TextStyle(fontSize: 20)),
      ),
      );
  }
  
}