import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  String? name;
  String? password;
  String? uid;
  String? email;

  AdminModel({
    this.email,
    this.name,
    this.password,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory AdminModel.fromDoc(DocumentSnapshot snapshot) {
    return AdminModel(
      uid: snapshot['uid'],
      password: snapshot['password'],
      name: snapshot['name'],
      email: snapshot['email'],
    );
  }
}
