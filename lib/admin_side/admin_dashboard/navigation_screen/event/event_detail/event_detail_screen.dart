import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/utils/app_utils.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../../model/university_event_model.dart';

class EventDetailScreen extends StatefulWidget {
  final UniversityEventModel universityEventModel;
  const EventDetailScreen({
    super.key,
    required this.universityEventModel,
  });

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: AppUtils.getHeight(context, 0.6),
                    child: Image.network(
                      widget.universityEventModel.imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection("Event")
                              .doc(widget.universityEventModel.uid)
                              .delete();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.delete,
                          color: AppColor.redColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    title: widget.universityEventModel.title,
                    weight: FontWeight.bold,
                    size: 17,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  ReusableText(
                    title: widget.universityEventModel.description,
                    color: AppColor.blackColor.withOpacity(0.5),
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        ReusableText(
                          title: 'Event Venue: ',
                          weight: FontWeight.bold,
                        ),
                        ReusableText(
                          title: widget.universityEventModel.place,
                          weight: FontWeight.bold,
                          color: AppColor.blackColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.event),
                        ReusableText(
                          title: 'Date : ',
                          weight: FontWeight.bold,
                        ),
                        ReusableText(
                          title: widget.universityEventModel.date,
                          weight: FontWeight.w500,
                          color: AppColor.blackColor.withOpacity(0.5),
                        ),
                        Spacer(),
                        Icon(Icons.access_time_outlined),
                        ReusableText(
                          title: 'Time :',
                          weight: FontWeight.bold,
                        ),
                        ReusableText(
                          title: widget.universityEventModel.time,
                          weight: FontWeight.w500,
                          color: AppColor.blackColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
