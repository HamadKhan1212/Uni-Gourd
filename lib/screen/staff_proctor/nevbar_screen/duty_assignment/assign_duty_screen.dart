import 'package:flutter/material.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

class AssignDuty extends StatefulWidget {
  const AssignDuty({super.key});

  @override
  State<AssignDuty> createState() => _AssignDutyState();
}

class _AssignDutyState extends State<AssignDuty> {
  final semesterC = TextEditingController();
  final timeC = TextEditingController();
  final placeC = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Duty'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _key,
            child: (Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: semesterC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter detail about the semester of a student';
                    }
                    return null;
                  },
                  hintText: 'Semester',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: timeC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter Duty time';
                    }
                    return null;
                  },
                  hintText: 'Duty time',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: placeC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter duty place';
                    }
                    return null;
                  },
                  hintText: 'Duty place',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  title: 'Assign Duty',
                  onTap: () {
                    if (_key.currentState!.validate()) {}
                  },
                  buttonColor: AppColor.primaryColor,
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
