import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:car_sharev1/constants/image_strings.dart';
import 'package:car_sharev1/constants/text_strings.dart';
import 'package:car_sharev1/UI/profile/payment.dart';
import 'package:car_sharev1/UI/profile/update_profile_screen.dart';
import 'package:car_sharev1/UI/profile/vehicle.dart';

import 'ProfileMenu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text("My Account", style: Theme.of(context).textTheme.headlineSmall)
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120, height: 120,
                      child: ClipRRect(borderRadius: BorderRadius.circular(40), child: const Image(image: AssetImage(tProfileImage))),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Text(tProfileHeading, style: Theme.of(context).textTheme.headlineSmall),
                        Text(tProfileSubHeading, style: Theme.of(context).textTheme.bodyMedium),
                      ]
                    ),
                  ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),

              //MENU
              ProfileMenu(title: "Edit Profile", icon: LineAwesomeIcons.user, onPress: () => Get.to(() => const UpdateProfileScreen())),
              ProfileMenu(title: "Payment Method", icon: LineAwesomeIcons.wallet, onPress: () => Get.to(() => const Payment())),
              ProfileMenu(title: "Vehicles", icon: LineAwesomeIcons.car, onPress: () => Get.to(() => const Vehicle())),
              ProfileMenu(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {}),
              ProfileMenu(title: "Help and Support", icon: LineAwesomeIcons.question_circle, onPress: () {}),
              ProfileMenu(title: "Privacy Policy", icon: LineAwesomeIcons.file, onPress: () {}),
              ProfileMenu(title: "Logout", icon: LineAwesomeIcons.alternate_sign_out, textColor: Colors.red, endIcon: false, onPress: () {}),

            ],
          ),
        ),
      ),
    );
  }
}
