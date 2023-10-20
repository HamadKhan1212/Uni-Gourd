import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import 'assign_duty_screen.dart';

class DutyDetail extends StatefulWidget {
  const DutyDetail({super.key});

  @override
  State<DutyDetail> createState() => _DutyDetailState();
}

class _DutyDetailState extends State<DutyDetail> {
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
                  builder: (BuildContext context) => const AssignDuty()));
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
              title: 'Duty Detail',
            )
          ],
        ),
      ),
    );
  }
}
