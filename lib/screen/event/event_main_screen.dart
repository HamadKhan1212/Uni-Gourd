import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../admin_side/admin_dashboard/model/university_event_model.dart';
import 'event_detail/event_detail_screen.dart';

class UniverstyEventUsers extends StatefulWidget {
  const UniverstyEventUsers({super.key});

  @override
  State<UniverstyEventUsers> createState() => _UniverstyEventUsersState();
}

class _UniverstyEventUsersState extends State<UniverstyEventUsers> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReusableText(
            title: 'Events',
            size: 20,
            weight: FontWeight.w500,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Event')
                  .orderBy('currentTime', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No data Found'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    UniversityEventModel universityEventModel =
                        UniversityEventModel.fromDoc(
                            snapshot.data!.docs[index]);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EventDetailScreen(
                                        universityEventModel:
                                            universityEventModel,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColor.lightGreenColor.withOpacity(0.7),
                                  offset: Offset(
                                    5,
                                    5,
                                  ),
                                  blurRadius: 30,
                                  spreadRadius: -10)
                            ],
                            border: Border.all(
                                color:
                                    AppColor.lightGreenColor.withOpacity(0.5),
                                width: 3),
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffE0DCA0),
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              ListTile(
                                title: ReusableText(
                                    title: universityEventModel.title,
                                    weight: FontWeight.bold,
                                    color: AppColor.blackColor),

                                // title: ReusableText(
                                //   title: addEventToFirebaseModel
                                //       .description!,
                                //   color: Colors.white,
                                // ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ReusableText(
                                    title: universityEventModel.description!
                                        .substring(0, 50),
                                    color: AppColor.blackColor.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.event_note,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const ReusableText(
                                          title: 'Date:',
                                          weight: FontWeight.w600,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        ReusableText(
                                          title: universityEventModel.date,
                                          color: AppColor.blackColor
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time_outlined,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const ReusableText(
                                          title: 'Time:',
                                          weight: FontWeight.w600,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        ReusableText(
                                          title: universityEventModel.time,
                                          color: AppColor.blackColor
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, right: 10, bottom: 2),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: ReusableText(
                                    title: 'See more',
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
        ],
      ),
    );
    //   Scaffold(
    //   floatingActionButton: FloatingActionButton(
    //     backgroundColor: AppColor.primaryColor,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     onPressed: () {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (BuildContext context) => const AddEventScreen()));
    //     },
    //     child: const Icon(Icons.add),
    //   ),
    //   body: Center(
    //     child: ,
    //   ),
    // );
  }
}
