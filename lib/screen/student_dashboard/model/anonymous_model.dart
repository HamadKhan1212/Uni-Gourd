import 'package:cloud_firestore/cloud_firestore.dart';

class AnonymousModel {
  String? name;
  String? email;
  String? uid;
  String? address;
  String? imageUrl;
  AnonymousModel(
      {this.imageUrl, this.uid, this.email, this.name, this.address});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'imageUrl': imageUrl,
      'address': address,
      'email': email
    };
  }

  factory AnonymousModel.fromDoc(DocumentSnapshot snapshot) {
    return AnonymousModel(
        uid: snapshot['uid'],
        email: snapshot['email'],
        imageUrl: snapshot['imageUrl'],
        name: snapshot['name'],
        address: snapshot['address']);
  }
}
