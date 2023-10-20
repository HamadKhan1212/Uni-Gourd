import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import 'add_report.dart';

class ReportDetail extends StatefulWidget {
  const ReportDetail({super.key});

  @override
  State<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
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
                  builder: (BuildContext context) => const AddReport()));
        },
        child: const Icon(
          Icons.add,
          color: AppColor.whiteColor,
          size: 30,
        ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
              title: 'My Complaint',
            )
          ],
        ),
      ),
    );
  }
}
