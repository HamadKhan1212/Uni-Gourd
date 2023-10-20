import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';

import '../../themes/color.dart';
import 'navigation_screen/event_notification_screen.dart';
import 'navigation_screen/proctor_duty_detail_screen.dart';
import 'navigation_screen/proctor_profile.dart';
import 'navigation_screen/report/report_detail.dart';

class ProctorNevBar extends StatefulWidget {
  const ProctorNevBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProctorNevBar> createState() => _ProctorNevBarState();
}

class _ProctorNevBarState extends State<ProctorNevBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const ProctorDutyDetailScreen(),
    const EventNotification(),
    const ReportDetail(),
    const ProctorProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: AppColor.primaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 70,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: SizedBox(
                  height: 70,
                  width: 60,
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 30,
                        color: _currentIndex == 0
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      Spacer(),
                      Image.asset(
                        'images/icon/dutyAssignment.png',
                        color: _currentIndex == 0 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child: SizedBox(
                  height: 70,
                  width: 60,
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 30,
                        color: _currentIndex == 1
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      Spacer(),
                      Image.asset(
                        'images/icon/event.png',
                        color: _currentIndex == 1 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: SizedBox(
                  height: 70,
                  width: 60,
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 30,
                        color: _currentIndex == 2
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      Spacer(),
                      Image.asset(
                        'images/icon/report.png',
                        color: _currentIndex == 2 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
                child: SizedBox(
                  height: 70,
                  width: 60,
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 30,
                        color: _currentIndex == 3
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      Spacer(),
                      Image.asset(
                        'images/icon/profile.png',
                        color: _currentIndex == 3 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () async {
          await BarcodeScanner.scan().then((value) {
            if (value.rawContent.isNotEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      child: Text(value.rawContent),
                    ),
                  );
                },
              );
            }
          });
        },
        child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.primaryColor),
            child: const Icon(
              Icons.qr_code,
              color: Colors.white,
              size: 40,
            )),
      ),
    ));
  }
}
