import 'package:flutter/material.dart';

class SearchTrajet extends StatefulWidget{
  @override 
  _SearcTrajetState createState() =>_SearcTrajetState();
}

class _SearcTrajetState extends State<SearchTrajet> {
   @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bonjour'),),
      body: const Center(
        child: Text('Publier un trajet', style: TextStyle(fontSize: 20)),
      ),
      );
  }
  
}