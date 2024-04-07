import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:car_sharev1/UI/profile/dropDownButton.dart';


class Vehicle extends StatelessWidget {
  const Vehicle({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => Get.back(),icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text("Manage Vehicle", style: Theme.of(context).textTheme.headlineSmall)
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(child: Column(
                children: [
                  const Row(
                      children: [
                        Text("Car Model: "),
                        MyDropdownButton(selectedValue: "Sedan", hint: "Car Type", dropdownItems: ["Sedan", "SUV", "Pickup","Minivan","Micro"]),
                      ]
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      decoration: const InputDecoration(label: Text("Model Name"))
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      decoration: const InputDecoration(label: Text(" Vehicle Plate No"))
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                    Text("No of seats: "),
                      MyDropdownButton(selectedValue: "2", hint: "No of seats", dropdownItems: ["1", "2", "3","4","5"]),
                    ]
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      decoration: const InputDecoration(label: Text("Vehicle color"))
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent, side: BorderSide.none, shape: const StadiumBorder()),
                      child: const Text("Add vehicle", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
