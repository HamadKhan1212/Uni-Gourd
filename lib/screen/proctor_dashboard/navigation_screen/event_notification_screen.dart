import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../../admin_side/admin_dashboard/model/university_event_model.dart';
import '../../../admin_side/admin_dashboard/navigation_screen/event/event_detail/event_detail_screen.dart';

class EventNotification extends StatefulWidget {
  const EventNotification({super.key});

  @override
  State<EventNotification> createState() => _EventNotificationState();
}

class _EventNotificationState extends State<EventNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Event',
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Event').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No data Found'));
                }

                return Expanded(
                  child: ListView.builder(
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
                                    color: AppColor.lightGreenColor
                                        .withOpacity(0.7),
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
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffE0DCA0),
                            ),
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
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
                                        color: AppColor.blackColor
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Row(
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
                                        const SizedBox(
                                          width: 10,
                                        ),
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
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
