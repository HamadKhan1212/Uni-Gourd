import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import '../../../models/user_model.dart';

class AddUsersFunction {
  static addStaff(context, name, employeeId, department, phoneNumber, email,
      password) async {
    try {
      EasyLoading.show(status: 'please wait');
      String uid = Uuid().v4();
      UserModel userModel = UserModel(
          name: name,
          userId: employeeId,
          deportment: department,
          phoneNumber: phoneNumber,
          uid: uid,
          email: email,
          password: password,
          isStudent: false,
          isStaffProctor: true,
          isProctor: false);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userModel.toMap())
          .then((value) {
        EasyLoading.dismiss();
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  static addStudentProctor(context, name, employeeId, department, phoneNumber,
      email, password) async {
    try {
      EasyLoading.show(status: 'please wait');
      String uid = Uuid().v4();
      UserModel userModel = UserModel(
          name: name,
          userId: employeeId,
          deportment: department,
          phoneNumber: phoneNumber,
          uid: uid,
          email: email,
          password: password,
          isStudent: false,
          isStaffProctor: false,
          isProctor: true);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userModel.toMap())
          .then((value) {
        EasyLoading.dismiss();
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }
}
