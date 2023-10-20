import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/global.dart';
import 'add_complaint_model.dart';

class ComplaintServices {
  static addComplaint(
      {title, description, imageUrl, context, name, deportment, email}) async {
    try {
      EasyLoading.show(status: 'please wait');
      EasyLoading.show(status: "Please wait", dismissOnTap: true);
      final stor = FirebaseStorage.instance
          .ref('image/event/${DateTime.now().millisecondsSinceEpoch}');
      final data = stor.putFile(File(imageUrl!));
      final snapshot = await data.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();
      String uid = Uuid().v4();
      ComplainModel complainModel = ComplainModel(
          uid: uid,
          userUid: currentUserId,
          title: title,
          name: name,
          department: deportment,
          email: email,
          imageUrl: url,
          description: description);
      await FirebaseFirestore.instance
          .collection('complaint')
          .doc(uid)
          .set(complainModel.toMap())
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
