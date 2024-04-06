
import 'package:flutter/material.dart';

class Mytrajet extends StatefulWidget{
  @override
  _MytrajetState createState() => _MytrajetState();
}

class _MytrajetState extends State<Mytrajet> {
  @override 
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Aucun trajet pour le moment !', style: TextStyle(fontSize: 20)),
      ),
      );
  }
}