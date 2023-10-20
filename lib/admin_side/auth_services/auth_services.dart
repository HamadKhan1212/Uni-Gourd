import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import '../admin_dashboard/Admin_nev_bar.dart';
import '../admin_dashboard/model/admin_model.dart';

class AuthServicesForAdmin {
  static createAdmin({
    required context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show(status: "Please wait");
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid = const Uuid().v4();
      AdminModel userModel = AdminModel(
        uid: uid,
        name: name,
        email: email,
      );

      await FirebaseFirestore.instance
          .collection("admins")
          .doc(uid)
          .set(userModel.toMap());
      EasyLoading.dismiss();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const AdminNevBar()));
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  static signInAdmin({email, password, context}) async {
    try {
      EasyLoading.show(status: 'please wait');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      EasyLoading.dismiss();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const AdminNevBar()));
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }
}
