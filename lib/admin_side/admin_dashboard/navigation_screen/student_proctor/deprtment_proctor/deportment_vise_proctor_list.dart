import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../models/user_model.dart';
import '../../../../../themes/color.dart';
import '../../../../../wedgits/reusable_text.dart';

class DeportmentProctor extends StatefulWidget {
  final String deportmentName;
  const DeportmentProctor({super.key, required this.deportmentName});

  @override
  State<DeportmentProctor> createState() => _DeportmentProctorState();
}

class _DeportmentProctorState extends State<DeportmentProctor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: ReusableText(
            title: widget.deportmentName,
          ),
        ),
        body: Column(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('isProctor', isEqualTo: true)
                    .where('deportment', isEqualTo: widget.deportmentName)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ReusableText(
                          title: 'No data found',
                          size: 20,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      UserModel addStaffModel =
                          UserModel.fromDoc(snapshot.data!.docs[index]);
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          radius: 20,
                          backgroundColor: AppColor.primaryColor,
                        ),
                        title: ReusableText(
                          title: addStaffModel.name,
                        ),
                        subtitle: ReusableText(
                          title: addStaffModel.deportment,
                        ),
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
