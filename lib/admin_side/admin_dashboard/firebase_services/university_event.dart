import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import '../model/university_event_model.dart';

class UniversityEvent {
  static addEvent({
    context,
    description,
    time,
    place,
    title,
    date,
    imageUrl,
  }) async {
    try {
      EasyLoading.show(status: "Please wait", dismissOnTap: true);
      final stor = FirebaseStorage.instance
          .ref('image/event/${DateTime.now().millisecondsSinceEpoch}');
      final data = stor.putFile(File(imageUrl!));
      final snapshot = await data.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();

      String uid = Uuid().v4();
      UniversityEventModel addUser = UniversityEventModel(
          uid: uid,
          title: title,
          description: description,
          time: time,
          place: place,
          date: date,
          currentTime: DateTime.now(),
          imageUrl: url);
      await FirebaseFirestore.instance
          .collection('Event')
          .doc(uid)
          .set(addUser.toMap())
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

  static addEventAdmin({
    context,
    description,
    time,
    place,
    title,
    date,
    imageUrl,
  }) async {
    try {
      EasyLoading.show(status: "Please wait", dismissOnTap: true);
      final stor = FirebaseStorage.instance
          .ref('image/event/${DateTime.now().millisecondsSinceEpoch}');
      final data = stor.putData(imageUrl!);
      final snapshot = await data.whenComplete(() => null);
      final url = await snapshot.ref.getDownloadURL();

      String uid = Uuid().v4();
      UniversityEventModel addUser = UniversityEventModel(
          uid: uid,
          title: title,
          description: description,
          time: time,
          place: place,
          date: date,
          currentTime: DateTime.now(),
          imageUrl: url);
      await FirebaseFirestore.instance
          .collection('Event')
          .doc(uid)
          .set(addUser.toMap())
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

  static deleteEvent(uid) {
    FirebaseFirestore.instance.collection('Event').doc(uid).delete();
  }
}
