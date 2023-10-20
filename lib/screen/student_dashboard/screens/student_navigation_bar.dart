import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proctorialboard/screen/student_dashboard/screens/student_profile_screen.dart';

import '../../../themes/color.dart';
import '../../proctor_dashboard/navigation_screen/event_notification_screen.dart';
import 'complaint/complaints.dart';
import 'emergency.dart';

class StudentNevBar extends StatefulWidget {
  const StudentNevBar({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentNevBar> createState() => _StudentNevBarState();
}

class _StudentNevBarState extends State<StudentNevBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    EventNotification(),
    Complaints(),
    Emergency(),
    StudentProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        child: FloatingNavbar(
          margin: EdgeInsets.zero,
          backgroundColor: AppColor.greyColor.shade300,
          selectedBackgroundColor: AppColor.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: AppColor.blackColor,
          onTap: (val) {
            setState(() {
              _currentIndex = val;
            }); //returns tab id which is user tapped
          },
          items: [
            FloatingNavbarItem(icon: FontAwesomeIcons.calendarDay),
            FloatingNavbarItem(icon: FontAwesomeIcons.file),
            FloatingNavbarItem(
              icon: Icons.add_alert_sharp,
            ),
            FloatingNavbarItem(
              icon: Icons.person,
            ),
          ],
          currentIndex: _currentIndex,
        ),
      ),
    ));
  }
}
