import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../../screen/student_dashboard/model/add_complaint_model.dart';
import '../../../themes/color.dart';

class HandleComplaint extends StatefulWidget {
  const HandleComplaint({super.key});

  @override
  State<HandleComplaint> createState() => _HandleComplaintState();
}

class _HandleComplaintState extends State<HandleComplaint> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('complaint')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const ReusableText(
                    title: 'No data found',
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  physics: NeverScrollableScrollPhysics(),
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
                            dense: false,
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
                              title: complainModel.description?.substring(0, 5),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              // GridView.builder(
              //     itemCount: snapshot.data!.docs.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         childAspectRatio: 0.9, crossAxisCount: 3),
              //     itemBuilder: (BuildContext context, int index) {
              //       ComplainModel complainModel =
              //           ComplainModel.fromDoc(snapshot.data!.docs[index]);
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           height: 80,
              //           width: double.infinity,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               color: AppColor.greyColor.shade500),
              //           child: GestureDetector(
              //             onTap: () {},
              //             child: ListTile(
              //               dense: false,
              //               title: Padding(
              //                 padding: const EdgeInsets.only(bottom: 10.0),
              //                 child: ReusableText(
              //                   title: complainModel.title,
              //                   size: 16,
              //                   weight: FontWeight.w600,
              //                   color: AppColor.whiteColor,
              //                 ),
              //               ),
              //               subtitle: ReusableText(
              //                 title: complainModel.description,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   );

              ),
        ],
      ),
    );
  }
}
