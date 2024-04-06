import 'package:flutter/material.dart';

class SuiviTraj extends StatefulWidget {
  @override
  _SuiviTrajState createState() => _SuiviTrajState();
}

class _SuiviTrajState extends State<SuiviTraj> {
  @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: const Center(
        child: Text('Suivi des trajets',style:TextStyle(fontSize: 40)),
       ),
     );
     }
}