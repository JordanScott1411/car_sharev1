import 'package:flutter/material.dart';

class SuiviTraj extends StatefulWidget {
  const SuiviTraj({super.key});

  @override
  _SuiviTrajState createState() => _SuiviTrajState();
}

class _SuiviTrajState extends State<SuiviTraj> {
  @override
   Widget build(BuildContext context) {
     return const Scaffold(
       body: Center(
        child: Text('Suivi des trajets',style:TextStyle(fontSize: 40)),
       ),
     );
     }
}