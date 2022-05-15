import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/auth/models/auth_model.dart';
import 'package:quiz_app/panels/admin/views/dashboard_page.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  File? image;
  //This method is for signup
  void signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile')
        .child(auth.currentUser!.uid);
    await ref.putFile(image!);
    final url = await ref.getDownloadURL();
    Map<String, dynamic> userInfo = {
      'name': name,
      'email': email,
      'imgPath': url,
    };

    await auth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      firebaseFirestore
          .collection('user')
          .doc(value.user!.uid)
          .set(userInfo)
          .then((value) async {
        // await firebaseFirestore
        //     .collection('user')
        //     .doc(auth.currentUser!.uid)
        //     .update({
        //   'imgPath': url,
        // }).then((value) {
        //   Get.snackbar(
        //       'Data Upload', 'Your are successfully create your account');
        // });
        Get.offAll(() => const DashboardPage());
      });
    }).catchError((e) {
      Get.snackbar('Error', e.toString());
    });
  }

  void login(String email, String password) async {
    await auth
        .signInWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((value) {
      Get.offAll(() => const DashboardPage());
    });
  }

//here we going to get data from firebase database
  Rx<AuthModel> userModel = AuthModel().obs;
  AuthModel get getuser => userModel.value;
  set getuser(AuthModel value) => userModel.value = value;
  getUser() async {
    try {
      DocumentSnapshot doc = await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .get();
      getuser = AuthModel.fromSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
