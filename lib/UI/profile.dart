
import 'package:flutter/material.dart';

  class Profile extends StatefulWidget {
    @override
    _ProfileState createState() => _ProfileState();
  }
  
  class _ProfileState extends State<Profile> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: const Center(
          child: Text('Mon profile', style: TextStyle(fontSize: 40),),
        ),
      );
    }  
  }