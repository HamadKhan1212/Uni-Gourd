import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../../../../deportment_list.dart';
import 'deprtment_proctor/deportment_vise_proctor_list.dart';

class StudentProctorScreen extends StatefulWidget {
  const StudentProctorScreen({super.key});

  @override
  State<StudentProctorScreen> createState() => _StudentProctorScreenState();
}

class _StudentProctorScreenState extends State<StudentProctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: deportment.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2, crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DeportmentProctor(
                                    deportmentName: deportment[index],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.lightGreenColor.withOpacity(0.7),
                              offset: Offset(
                                5,
                                5,
                              ),
                              blurRadius: 30,
                              spreadRadius: -10)
                        ],
                        border: Border.all(
                            color: AppColor.lightGreenColor.withOpacity(0.5),
                            width: 3),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffE0DCA0),
                      ),
                      width: double.infinity,
                      child: Center(
                        child: ReusableText(
                          title: deportment[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // ...List.generate(
          //   deportment.length,
          //   (index) => GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) => DeportmentProctor(
          //                     deportmentName: deportment[index],
          //                   )));
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(
          //           padding: const EdgeInsets.all(10),
          //           height: 50,
          //           width: 100,
          //           color: AppColor.greyColor.shade200,
          //           child: ReusableText(
          //             title: deportment[index],
          //           )),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
