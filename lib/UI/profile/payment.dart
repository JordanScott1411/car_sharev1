import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:car_sharev1/constants/image_strings.dart';
import 'package:car_sharev1/UI/profile/paymentMenu.dart';



class Payment extends StatelessWidget {
  const Payment({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => Get.back(),icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text("Payment Method", style: Theme.of(context).textTheme.headlineSmall)
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              PaymentMenu(title: "Pay with Momo", pic: tMomo, onPress: () {}),
              PaymentMenu(title: "Pay with OM", pic: tOM, onPress: () {}),
              PaymentMenu(title: "Pay with Credit Card", pic: tCard, onPress: () {}),

            ],
          ),
        ),
      ),
    );
  }
}
