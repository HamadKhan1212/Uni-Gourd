import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
              title: 'Emergency',
              size: 30,
              color: AppColor.redColor,
            ),
            ReusableText(
              textAlign: TextAlign.center,
              title:
                  'If there is any Emergency then click on\nbellow button your live location will\nbe send to addministration\nfor your help  ',
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColor.redColor,
                child: ReusableText(
                  title: 'Help',
                  color: AppColor.whiteColor,
                  weight: FontWeight.w600,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
