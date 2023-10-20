import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proctorialboard/models/user_model.dart';
import 'package:proctorialboard/screen/auth_screen/login_screen.dart';
import 'package:proctorialboard/screen/proctor_dashboard/bottom_nav_bar.dart';
import 'package:proctorialboard/screen/staff_proctor/staff_nev_bar.dart';
import 'package:proctorialboard/screen/student_dashboard/model/anonymous_model.dart';
import 'package:proctorialboard/screen/student_dashboard/screens/student_navigation_bar.dart';

import '../../utils/global.dart';

class AuthServices {
  static createUserAnonymously({
    required context,
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String deportment,
  }) async {
    try {
      EasyLoading.show(status: "Please wait");
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      currentUserId = FirebaseAuth.instance.currentUser!.uid;
      UserModel userModel = UserModel(
        uid: currentUserId,
        name: name,
        deportment: deportment,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        isStaffProctor: false,
        isProctor: false,
        isStudent: true,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .set(userModel.toMap());
      EasyLoading.dismiss();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => StudentNevBar()));
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  static logInAnonymously({email, password, context}) async {
    try {
      EasyLoading.show(status: 'please wait');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      EasyLoading.dismiss();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => StudentNevBar()));
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }

  static signInWithGoogle(BuildContext context) async {
    try {
      EasyLoading.show(status: "Please wait");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((userCredential) async {
        AnonymousModel anonymousModel = AnonymousModel(
            imageUrl: userCredential.user!.photoURL,
            email: userCredential.user!.email,
            uid: userCredential.user!.uid,
            name: userCredential.user!.displayName);
        await FirebaseFirestore.instance
            .collection("anonymous")
            .doc(userCredential.user!.uid)
            .set(anonymousModel.toMap());

        EasyLoading.dismiss();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => StudentNevBar()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.code);
      EasyLoading.dismiss();
    }
  }

  // static checkUser(BuildContext context) {
  //   final user = FirebaseAuth.instance.currentUser;
  //   Timer(Duration(seconds: 2), () {
  //     if (user != null) {
  //       Navigator.pushAndRemoveUntil(context,
  //           MaterialPageRoute(builder: (BuildContext context) {
  //         return StudentNevBar();
  //       }), (route) => false);
  //     } else {
  //       Navigator.pushAndRemoveUntil(context,
  //           MaterialPageRoute(builder: (BuildContext context) {
  //         return LogInAnonymously();
  //       }), (route) => false);
  //     }
  //   });
  // }

  static logOut(BuildContext context) async {
    EasyLoading.show(status: "Please wait");
    await FirebaseAuth.instance.signOut();
    EasyLoading.dismiss();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return LogInScreen();
    }), (route) => false);
    EasyLoading.dismiss();
  }

  static signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show(status: 'please wait');
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: email)
          .where('password', isEqualTo: password)
          .where('isStaffProctor', isEqualTo: true)
          .get();

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .where('isProctor', isEqualTo: true)
          .get();

      if (snap.docs.isNotEmpty) {
        currentUserId = await snap.docs.first["uid"];
        EasyLoading.dismiss();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StaffNevBar()));
      } else if (snapshot.docs.isNotEmpty) {
        currentUserId = await snapshot.docs.first["uid"];
        EasyLoading.dismiss();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProctorNevBar()));
      } else {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          currentUserId = value.user!.uid;
          EasyLoading.dismiss();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => StudentNevBar()));
          EasyLoading.dismiss();
        });
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
      EasyLoading.dismiss();
    }
  }
}
