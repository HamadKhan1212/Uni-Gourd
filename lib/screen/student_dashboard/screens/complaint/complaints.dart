import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proctorialboard/screen/student_dashboard/screens/complaint/Add_complaint.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../../../utils/global.dart';
import '../../model/add_complaint_model.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AddComplaint()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Complaint',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('complaint')
                  .where('userUid', isEqualTo: currentUserId)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                if (snapshot.data!.docs.isEmpty) {
                  return ReusableText(
                    title: 'No data found',
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    ComplainModel complainModel =
                        ComplainModel.fromDoc(snapshot.data!.docs[index]);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.greyColor.shade500),
                        child: GestureDetector(
                          onTap: () {},
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ReusableText(
                                title: complainModel.title,
                                size: 16,
                                weight: FontWeight.w600,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            subtitle: ReusableText(
                              title: complainModel.description,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
