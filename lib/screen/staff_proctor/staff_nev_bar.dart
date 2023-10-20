import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../utils/app_utils.dart';
import '../../wedgits/reusable_text.dart';
import '../event/event_main_screen.dart';
import 'nevbar_screen/duty_assignment/duty_detail_screen.dart';
import 'nevbar_screen/handle_complaint.dart';
import 'nevbar_screen/student_proctor/student_screen.dart';

int currentIndex = 0;

class StaffNevBar extends StatefulWidget {
  const StaffNevBar({
    Key? key,
  }) : super(key: key);

  @override
  State<StaffNevBar> createState() => _StaffNevBarState();
}

class _StaffNevBarState extends State<StaffNevBar> {
  final List<Widget> _pages = [
    const UniverstyEventUsers(),
    const AllStudentProctor(),
    const DutyDetail(),
    const HandleComplaint()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: currentIndex == 0
              ? const Text(
                  'Uni Guard',
                )
              : currentIndex == 1
                  ? const Text(
                      'Proctor List',
                    )
                  : currentIndex == 2
                      ? const Text(
                          'Duty Deatil',
                        )
                      : const Text(
                          'Complaint',
                        )),
      drawer: Drawer(
        width: AppUtils.getWidth(context, 0.5),
        backgroundColor: AppColor.primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: AppUtils.getHeight(context, 0.1),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                currentIndex = 0;
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 0
                        ? AppColor.whiteColor
                        : AppColor.transparentColor,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: ReusableText(
                      title: 'Event',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                currentIndex = 1;
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 1
                        ? AppColor.whiteColor
                        : AppColor.transparentColor,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: ReusableText(
                      title: 'Staff Proctor',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                currentIndex = 2;
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 2
                        ? AppColor.whiteColor
                        : AppColor.transparentColor,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: ReusableText(
                      title: 'Student Proctor',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                currentIndex = 3;
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == 3
                        ? AppColor.whiteColor
                        : AppColor.transparentColor,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: ReusableText(
                      title: 'Complaint',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColor.whiteColor,
      body: _pages[currentIndex],
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
                    currentIndex = 0;
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
                        color: currentIndex == 0
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      const Spacer(),
                      Image.asset(
                        'images/icon/event.png',
                        color: currentIndex == 0 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
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
                        color: currentIndex == 1
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      const Spacer(),
                      Image.asset(
                        'images/icon/teacher.png',
                        color: currentIndex == 1 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      const Spacer(),
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
                    currentIndex = 2;
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
                        color: currentIndex == 2
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      const Spacer(),
                      Image.asset(
                        'images/icon/report.png',
                        color: currentIndex == 2 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
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
                        color: currentIndex == 3
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      const Spacer(),
                      Image.asset(
                        'images/icon/complant.png',
                        color: currentIndex == 3 ? Colors.white : Colors.black,
                        height: 30,
                        width: 30,
                      ),
                      const Spacer(),
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
