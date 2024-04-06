import 'package:car_sharev1/UI/chat.dart';
import 'package:car_sharev1/UI/postTra.dart';
import 'package:car_sharev1/UI/profile.dart';
import 'package:car_sharev1/UI/mytrajet.dart';
import 'package:car_sharev1/UI/seachTrajet.dart';
import 'package:car_sharev1/UI/suiviTraj.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home ({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
//class _HomeState extends State<Home> {

  int currentTab = 0;
  final List<Widget>screens = [
    Mytrajet(),
    Chat(),
    Profile(),
    SuiviTraj(),
    PostTra(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Mytrajet();


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: PageStorage(
      bucket: bucket, 
      child: currentScreen,
   ),
   floatingActionButton: FloatingActionButton(

    child: Icon(Icons.search),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchTrajet()));
      //Action que doit faire ce boutton
    },
   ),
   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   bottomNavigationBar: BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment :CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed:() {
                    setState(() {
                      currentScreen= Mytrajet();
                      currentTab=0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.departure_board_rounded,
                        color: currentTab == 0? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Trajets',
                        style: TextStyle(color: currentTab ==0 ? Colors.blue : Colors.grey
                        ),
                      )
                    ],
                  ),
              ),
                MaterialButton(
              minWidth: 40,
              onPressed:() {
                setState(() {
                  currentScreen= PostTra();
                  currentTab=1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle,
                    color: currentTab == 1? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Publier',
                    style: TextStyle(color: currentTab ==1 ? Colors.blue : Colors.grey
                    ),
                  )
                ],
              ),
              )                
              ],
            ), 
            //Alignnement des la 2e partie des bouttons de navigation sur la droite
             Row(
              crossAxisAlignment :CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed:() {
                    setState(() {
                      currentScreen= Mytrajet();
                      currentTab=2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.messenger,
                        color: currentTab == 2? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Messages',
                        style: TextStyle(color: currentTab ==2 ? Colors.blue : Colors.grey
                        ),
                      )
                    ],
                  ),
              ),
                MaterialButton(
              minWidth: 40,
              onPressed:() {
                setState(() {
                  currentScreen= PostTra();
                  currentTab=3;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.supervised_user_circle,
                    color: currentTab == 3? Colors.blue : Colors.grey,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(color: currentTab ==3 ? Colors.blue : Colors.grey
                    ),
                  )
                ],
              ),
              )                
              ],
            ), 
          ],
        ),
        
        

      ),
   ),
   );
  }
}