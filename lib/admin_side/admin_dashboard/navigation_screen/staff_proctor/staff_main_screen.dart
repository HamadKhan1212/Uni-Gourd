import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proctorialboard/admin_side/admin_dashboard/navigation_screen/staff_proctor/staff_screen/staff_proctor_profile/staff_profile_screen.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../../../models/user_model.dart';

class StaffMainScreen extends StatefulWidget {
  const StaffMainScreen({super.key});

  @override
  State<StaffMainScreen> createState() => _StaffMainScreenState();
}

class _StaffMainScreenState extends State<StaffMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('isStaffProctor', isEqualTo: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: ReusableText(
                        title: 'No data found',
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      UserModel addStaffModel =
                          UserModel.fromDoc(snapshot.data!.docs[index]);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      StaffProfileScreen(
                                        name: addStaffModel.name!,
                                        email: addStaffModel.email!,
                                        department: addStaffModel.deportment!,
                                        phoneNumber: addStaffModel.phoneNumber!,
                                      )));
                        },
                        child: ListTile(
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
