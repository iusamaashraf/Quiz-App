import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  String? name;
  String? email;
  String? imgPath;
  String? id;

  AuthModel({
    this.id,
    this.name,
    this.email,
    this.imgPath,
  });
  AuthModel.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    name = data['name'] ?? "";
    email = data['email'] ?? "";
    imgPath = data['imgPath'] ?? "";
  }
}
