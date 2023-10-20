import 'package:cloud_firestore/cloud_firestore.dart';

class UniversityEventModel {
  String? description;
  String? time;
  String? uid;
  String? place;
  String? imageUrl;
  String? title;
  String? date;
  DateTime? currentTime;
  UniversityEventModel(
      {this.description,
      this.time,
      this.place,
      this.uid,
      this.title,
      this.imageUrl,
      this.currentTime,
      this.date});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'description': description,
      'time': time,
      'place': place,
      'imageUrl': imageUrl,
      'title': title,
      'date': date,
      'currentTime': currentTime,
    };
  }

  factory UniversityEventModel.fromDoc(DocumentSnapshot snapshot) {
    return UniversityEventModel(
        uid: snapshot['uid'],
        description: snapshot['description'],
        time: snapshot['time'],
        place: snapshot['place'],
        imageUrl: snapshot['imageUrl'],
        title: snapshot['title'],
        date: snapshot['date'],
        currentTime: (snapshot['currentTime'] as Timestamp).toDate());
  }
}
