import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> listInfo = [
    "Personal info",
    "Summary",
    "About Us",
    "Help Center",
    "Settings",

  ];

  List<IconData> listIcons = [
    Icons.person,
    Icons.article,
    Icons.info,
    Icons.help,
    Icons.settings
  ];

  List<String> AIlistInfo = [
    "Help Center",
    "AI Assistance",
  ];

  List<IconData> AIlistIcons = [
    Icons.assistant_sharp,
    Icons.local_atm,
  ];
  final double kDefaultPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome ",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(),
              ),
              const SizedBox(height: 20 / 2,),
              //  const PremiumCard(),
              const SizedBox(height: 20/2,),
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kDefaultPadding / 3),
                ),
                child: Column(children:  List.generate(
                  listIcons.length,
                      (index) => ListTile(
                    leading: Icon(
                      listIcons[index],
                      size: 20,
                      // color: kPrimaryColor,
                    ),
                    title: Text(
                      listInfo[index],
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    onTap: () {
                      // Action à exécuter lorsqu'un ListTile est cliqué
                      print('Tapped on ${listInfo[index]}');
                    },
                  ),
                ),
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "Other Service",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontFamily: "Montserrat",
                ),
              ),
              const SizedBox(height: 20 / 2,),
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kDefaultPadding / 3),
                ),
                child: Column(children:  List.generate(
                  AIlistIcons.length,
                      (index) => ListTile(
                    leading: Icon(
                      AIlistIcons[index],
                      size: 20,
                      // color: kPrimaryColor,
                    ),
                    title: Text(
                      AIlistInfo[index],
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    onTap: () {
                      // Action à exécuter lorsqu'un ListTile est cliqué
                      print('Tapped on ${listInfo[index]}');
                    },
                  ),
                ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Text(
        "Profiel",
      ),
    );
  }
}