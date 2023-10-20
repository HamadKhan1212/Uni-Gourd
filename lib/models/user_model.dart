import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? password;
  String? name;
  String? userId;
  String? deportment;
  String? phoneNumber;
  String? uid;
  String? imageUrl;
  bool? isStaffProctor;
  bool? isProctor;
  bool? isStudent;

  UserModel(
      {this.name,
      this.email,
      this.password,
      this.imageUrl,
      this.userId,
      this.uid,
      this.phoneNumber,
      this.deportment,
      this.isStaffProctor,
      this.isProctor,
      this.isStudent});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'uid': uid,
      'phoneNumber': phoneNumber,
      'deportment': deportment,
      'employeeId': userId,
      'isStaffProctor': isStaffProctor,
      'isProctor': isProctor,
      'isStudent': isStudent,
      'imageUrl': imageUrl
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot snapshot) {
    return UserModel(
      uid: snapshot['uid'],
      name: snapshot['name'],
      password: snapshot['password'],
      email: snapshot['email'],
      phoneNumber: snapshot['phoneNumber'],
      deportment: snapshot['deportment'],
      userId: snapshot['employeeId'],
      isStaffProctor: snapshot['isStaffProctor'],
      isProctor: snapshot['isProctor'],
      isStudent: snapshot['isStudent'],
      imageUrl: snapshot['imageUrl'],
    );
  }
}
