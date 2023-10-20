import 'package:cloud_firestore/cloud_firestore.dart';

class ComplainModel {
  String? title;
  String? name;
  String? department;
  String? email;
  String? description;
  String? uid;
  String? userUid;
  String? imageUrl;
  ComplainModel(
      {this.title,
      this.description,
      this.uid,
      this.userUid,
      this.department,
      this.name,
      this.imageUrl,
      this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'department': department,
      'email': email,
      'title': title,
      'description': description,
      'uid': uid,
      'userUid': userUid,
      'imageUrl': imageUrl
    };
  }

  factory ComplainModel.fromDoc(DocumentSnapshot snapshot) {
    return ComplainModel(
      title: snapshot['title'],
      description: snapshot['description'],
      uid: snapshot['uid'],
      userUid: snapshot['userUid'],
      name: snapshot['name'],
      email: snapshot['email'],
      imageUrl: snapshot['imageUrl'],
      department: snapshot['department'],
    );
  }
}
