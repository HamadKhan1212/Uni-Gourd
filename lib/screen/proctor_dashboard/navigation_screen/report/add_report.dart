import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

class AddReport extends StatefulWidget {
  const AddReport({super.key});

  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  final nameC = TextEditingController();
  final detailC = TextEditingController();
  final semesterC = TextEditingController();
  final deportmentC = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    nameC.dispose();
    detailC.dispose();
    semesterC.dispose();
    deportmentC.dispose();
    super.dispose();
  }

  String? selectedImage;
  pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = image.path;
      });
    }
  }

  List<String> deportment = [
    'urdu',
    'english',
    'pakistan Studies',
    'Software Engineering'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 10,
            right: 10,
          ),
          child: Form(
            key: _key,
            child: (Column(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () async {
                                  Navigator.pop(context);
                                  await pickImage(ImageSource.camera);
                                },
                                leading: const Icon(Icons.camera),
                                title: const Text('Camera'),
                              ),
                              ListTile(
                                onTap: () async {
                                  Navigator.pop(context);
                                  await pickImage(ImageSource.gallery);
                                },
                                leading: const Icon(Icons.image),
                                title: const Text('Gallery'),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: selectedImage == null
                            ? null
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(
                                    selectedImage!,
                                  ),
                                )),
                        color: AppColor.lightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.primaryColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          selectedImage == null
                              ? Icons.add_a_photo_outlined
                              : null,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: nameC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Student name must be enter';
                    }
                    return null;
                  },
                  hintText: 'Student name',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: semesterC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Student semester must be added';
                    }
                    return null;
                  },
                  hintText: 'Student semester',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: deportmentC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Student department must be added';
                    }
                    return null;
                  },
                  hintText: 'Student department',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: detailC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter complaint detail';
                    }
                    return null;
                  },
                  maxLines: 5,
                  hintText: 'Detail about report',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  title: 'Submit',
                  onTap: () {
                    if (selectedImage == null) {
                      EasyLoading.showError('Image required');
                    }
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
