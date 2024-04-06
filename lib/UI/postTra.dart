import 'package:flutter/material.dart';

class PostTra extends StatefulWidget{
  @override 
  _PostTraState createState() =>_PostTraState();
}

class _PostTraState extends State<PostTra> {
   @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Publier un trajet', style: TextStyle(fontSize: 20)),
      ),
      );
  }
  
}