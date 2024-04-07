import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, this.selectedIMage, this.image});
  final File? selectedIMage;
  final Uint8List? image;

  @override
  UpdateProfileScreenState createState() => UpdateProfileScreenState();
}

class UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late File? _selectedIMage;
  late Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _selectedIMage = widget.selectedIMage;
    _image = widget.image;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () => Get.back(),icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text("Edit Profile", style: Theme.of(context).textTheme.headlineSmall)
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                      radius: 100, backgroundImage: MemoryImage(_image!))
                      : const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(tProfileImage)
                  ),
                  Positioned(
                      bottom: -0,
                      left: 140,
                      child: IconButton(
                          onPressed: () {
                            showImagePickerOption(context);
                          },
                          icon: const Icon(Icons.add_a_photo)))
                ],
              ),
              Form(child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(label: Text("Name"), prefixIcon: Icon(LineAwesomeIcons.user))
                    ),
                  const SizedBox(height: 10),
                  TextFormField(
                      decoration: const InputDecoration(label: Text("Email"), prefixIcon: Icon(LineAwesomeIcons.envelope))
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      decoration: const InputDecoration(label: Text("Phone No"), prefixIcon: Icon(LineAwesomeIcons.phone))
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const UpdateProfileScreen()),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent, side: BorderSide.none, shape: const StadiumBorder()),
                      child: const Text("Save changes", style: TextStyle(color: Colors.black)),
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
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.image, size: 70),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt, size: 70),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      _selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      _selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
