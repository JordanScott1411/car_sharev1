import 'package:car_sharev1/UI/chat.dart';
import 'package:car_sharev1/UI/postTra.dart';
import 'package:car_sharev1/UI/mytrajet.dart';
import 'package:car_sharev1/UI/profile/profile_screen.dart';
import 'package:car_sharev1/UI/seachTrajet.dart';
import 'package:car_sharev1/UI/suiviTraj.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home ({super.key});
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
//class _HomeState extends State<Home> {

  int currentTab = 0;
  final List<Widget>screens = [
    const Mytrajet(),
    const Chat(),
    const ProfileScreen(),
    const SuiviTraj(),
    const PostTra(),

  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Mytrajet();


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: PageStorage(
          bucket: PageStorageBucket(),
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchTrajet()));
      //Action que doit faire ce bouton
        },
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
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
                      currentScreen= const Mytrajet();
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
                  currentScreen= const PostTra();
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
                      currentScreen = const Mytrajet();
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
                    currentScreen= const ProfileScreen();
                    currentTab=3;
                  });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineAwesomeIcons.user_circle,color: currentTab == 3? Colors.blue : Colors.grey,),
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
   )
    );
  }
}