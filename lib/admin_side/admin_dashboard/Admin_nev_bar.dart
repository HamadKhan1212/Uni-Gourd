import 'package:flutter/material.dart';
import 'package:proctorialboard/admin_side/admin_dashboard/navigation_screen/event/add_event/add_event_screen.dart';
import 'package:proctorialboard/admin_side/admin_dashboard/navigation_screen/report.dart';
import 'package:proctorialboard/admin_side/admin_dashboard/navigation_screen/staff_proctor/staff_screen/add_staff_proctor/add_staff_proctor.dart';
import 'package:proctorialboard/utils/app_utils.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../themes/color.dart';
import 'navigation_screen/complaint_screen.dart';
import 'navigation_screen/event/event_main_screen.dart';
import 'navigation_screen/staff_proctor/staff_main_screen.dart';
import 'navigation_screen/student_proctor/student_proctor_screen.dart';

int currentIndex = 0;

class AdminNevBar extends StatefulWidget {
  const AdminNevBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminNevBar> createState() => _AdminNevBarState();
}

class _AdminNevBarState extends State<AdminNevBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          centerTitle: true,
          actions: [
            currentIndex == 0
                ? TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AddEventScreen()));
                    },
                    child: ReusableText(
                      title: 'Add Event',
                      color: AppColor.whiteColor,
                    ))
                : currentIndex == 1
                    ? TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AddStaffProctor()));
                        },
                        child: ReusableText(
                          title: 'Add Staff Proctor',
                          color: AppColor.whiteColor,
                        ))
                    : currentIndex == 2
                        ? Icon(Icons.add)
                        : SizedBox(),
            SizedBox(
              width: 10,
            )
          ],
          title: currentIndex == 0
              ? const Text(
                  'Events',
                )
              : currentIndex == 1
                  ? const Text(
                      'Staff Proctor',
                    )
                  : currentIndex == 2
                      ? const Text(
                          'Student Proctor',
                        )
                      : const Text(
                          'Complaint',
                        )),
      backgroundColor: AppColor.whiteColor,
      body: Row(
        children: [
          Container(
            height: double.infinity,
            color: AppColor.primaryColor,
            width: AppUtils.getWidth(context, 0.2),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: currentIndex == 0
                        ? AppColor.greyColor
                        : AppColor.transparentColor,
                    child: Center(
                        child: ReusableText(
                      title: 'Events',
                      color: currentIndex == 0
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: currentIndex == 1
                        ? AppColor.greyColor
                        : AppColor.transparentColor,
                    child: Center(
                        child: ReusableText(
                      title: 'Staff Proctor',
                      color: currentIndex == 1
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: currentIndex == 2
                        ? AppColor.greyColor
                        : AppColor.transparentColor,
                    child: Center(
                        child: ReusableText(
                      title: 'Student Proctors',
                      color: currentIndex == 2
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: currentIndex == 3
                        ? AppColor.greyColor
                        : AppColor.transparentColor,
                    child: Center(
                        child: ReusableText(
                      title: 'Complaints',
                      color: currentIndex == 3
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 05,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 4;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: currentIndex == 4
                        ? AppColor.greyColor
                        : AppColor.transparentColor,
                    child: Center(
                        child: ReusableText(
                      title: 'Reports',
                      color: currentIndex == 4
                          ? AppColor.primaryColor
                          : AppColor.whiteColor,
                    )),
                  ),
                ),
              ],
            ),
          ),
          currentIndex == 0
              ? Event()
              : currentIndex == 1
                  ? StaffMainScreen()
                  : currentIndex == 2
                      ? StudentProctorScreen()
                      : currentIndex == 3
                          ? ComplaintScreen()
                          : Report()
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   padding: EdgeInsets.zero,
      //   color: AppColor.primaryColor,
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 5,
      //   clipBehavior: Clip.antiAlias,
      //   child: Container(
      //     height: 70,
      //     padding: const EdgeInsets.only(
      //       left: 10,
      //       right: 10,
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               currentIndex = 0;
      //             });
      //           },
      //           child: SizedBox(
      //             height: 70,
      //             width: 60,
      //             child: Column(
      //               children: [
      //                 Container(
      //                   height: 3,
      //                   width: 30,
      //                   color: currentIndex == 0
      //                       ? Colors.white
      //                       : Colors.transparent,
      //                 ),
      //                 const Spacer(),
      //                 Image.asset(
      //                   'images/icon/event.png',
      //                   color: currentIndex == 0 ? Colors.white : Colors.black,
      //                   height: 30,
      //                   width: 30,
      //                 ),
      //                 const Spacer(),
      //               ],
      //             ),
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               currentIndex = 1;
      //             });
      //           },
      //           child: SizedBox(
      //             height: 70,
      //             width: 60,
      //             child: Column(
      //               children: [
      //                 Container(
      //                   height: 3,
      //                   width: 30,
      //                   color: currentIndex == 1
      //                       ? Colors.white
      //                       : Colors.transparent,
      //                 ),
      //                 const Spacer(),
      //                 Image.asset(
      //                   'images/icon/teacher.png',
      //                   color: currentIndex == 1 ? Colors.white : Colors.black,
      //                   height: 30,
      //                   width: 30,
      //                 ),
      //                 const Spacer(),
      //               ],
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 40,
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               currentIndex = 2;
      //             });
      //           },
      //           child: SizedBox(
      //             height: 70,
      //             width: 60,
      //             child: Column(
      //               children: [
      //                 Container(
      //                   height: 3,
      //                   width: 30,
      //                   color: currentIndex == 2
      //                       ? Colors.white
      //                       : Colors.transparent,
      //                 ),
      //                 const Spacer(),
      //                 Image.asset(
      //                   'images/icon/report.png',
      //                   color: currentIndex == 2 ? Colors.white : Colors.black,
      //                   height: 30,
      //                   width: 30,
      //                 ),
      //                 const Spacer(),
      //               ],
      //             ),
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               currentIndex = 3;
      //             });
      //           },
      //           child: SizedBox(
      //             height: 70,
      //             width: 60,
      //             child: Column(
      //               children: [
      //                 Container(
      //                   height: 3,
      //                   width: 30,
      //                   color: currentIndex == 3
      //                       ? Colors.white
      //                       : Colors.transparent,
      //                 ),
      //                 const Spacer(),
      //                 Image.asset(
      //                   'images/icon/complant.png',
      //                   color: currentIndex == 3 ? Colors.white : Colors.black,
      //                   height: 30,
      //                   width: 30,
      //                 ),
      //                 const Spacer(),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: GestureDetector(
      //   onTap: () async {
      //     await BarcodeScanner.scan().then((value) {
      //       if (value.rawContent.isNotEmpty) {
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return Dialog(
      //               child: Container(
      //                 child: Text(value.rawContent),
      //               ),
      //             );
      //           },
      //         );
      //       }
      //     });
      //   },
      //   child: Container(
      //       padding: const EdgeInsets.all(15),
      //       decoration: const BoxDecoration(
      //           shape: BoxShape.circle, color: AppColor.primaryColor),
      //       child: const Icon(
      //         Icons.qr_code,
      //         color: Colors.white,
      //         size: 40,
      //       )),
      // ),
    ));
  }
}
