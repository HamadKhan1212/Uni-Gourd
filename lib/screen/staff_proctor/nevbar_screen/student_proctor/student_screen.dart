import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../../../models/user_model.dart';
import 'add_student_screen.dart';

class AllStudentProctor extends StatefulWidget {
  const AllStudentProctor({super.key});

  @override
  State<AllStudentProctor> createState() => _AllStudentProctorState();
}

class _AllStudentProctorState extends State<AllStudentProctor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AddStudentProctor()));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('isProctor', isEqualTo: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return ReusableText(
                        title: 'No data found',
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
      ),
    );
  }
}
