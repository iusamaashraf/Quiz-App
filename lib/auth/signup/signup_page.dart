import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/auth/controller/auth_controller.dart';
import 'package:quiz_app/utils/size_config.dart';
import 'package:quiz_app/widgets/my_input_field.dart';
import 'package:quiz_app/widgets/primary_button.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final AuthController controller = Get.put(AuthController());
  Image? myImage;
  //make image circular
  Future<Image> convertFileToImage(File picture) async {
    List<int> imageBase64 = picture.readAsBytesSync();
    String imageAsString = base64Encode(imageBase64);
    Uint8List uint8list = base64.decode(imageAsString);
    Image image = Image.memory(uint8list);
    setState(() {
      myImage = image;
    });
    print('MY image is $myImage');
    return image;
  }

//pick image

  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: sr);

      final imageTemporary = File(image!.path);
      setState(() {
        controller.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

//here is the function to get image source

  showOptionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //for picking video functionality
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.gallery);
              Get.back();
            },
            child: Row(
              children: [
                const Icon(Icons.image, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Gallery',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.camera);
              Get.back();
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Camera',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                const Icon(Icons.cancel, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //upload to firestore image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4 * SizeConfig.widthMultiplier),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                GestureDetector(
                    onTap: () {
                      showOptionDialog(context);
                    },
                    child: Container(
                      height: 12 * SizeConfig.heightMultiplier,
                      width: 12 * SizeConfig.widthMultiplier,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: controller.image != null
                          ? Image.file(
                              controller.image!,
                              fit: BoxFit.cover,
                            )
                          : const SizedBox(),
                    )),
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: nameController,
                  hint: 'Name',
                  textInputType: TextInputType.name,
                  validator: (val) {
                    return '';
                  },
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: emailController,
                  hint: 'Email',
                  textInputType: TextInputType.emailAddress,
                  validator: (val) {
                    return '';
                  },
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                MyInputField(
                  controller: passwordController,
                  hint: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  isObsure: true,
                  validator: (val) {
                    return '';
                  },
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                PrimaryButton(
                  onTap: () {
                    // print(image);
                    controller.signup(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
