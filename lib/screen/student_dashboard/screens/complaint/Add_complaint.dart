import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

import '../../../../utils/global.dart';
import '../../model/add_complaint.dart';

class AddComplaint extends StatefulWidget {
  const AddComplaint({super.key});

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  final titleC = TextEditingController();
  final descriptionC = TextEditingController();
  final _key = GlobalKey<FormState>();
  String? name;
  String? email;
  String? department;

  getUserData() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserId)
        .get();
    name = snap["name"];
    email = snap["email"];
    department = snap["deportment"];
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleC.dispose();
    descriptionC.dispose();
    super.dispose();
  }

  String? selectedImage;
  pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      selectedImage = image.path;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Complaint'),
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
                                  File(selectedImage!),
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
                  controller: titleC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Title must be added';
                    }
                    return null;
                  },
                  hintText: 'Title',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  controller: descriptionC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter complaint detail';
                    }
                    return null;
                  },
                  maxLines: 5,
                  hintText: 'Detail about complaint',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  title: 'Submit Complaint',
                  onTap: () async {
                    if (selectedImage == null) {
                      EasyLoading.showError('Image required');
                    } else {
                      if (_key.currentState!.validate()) {
                        await ComplaintServices.addComplaint(
                            name: name,
                            description: descriptionC.text,
                            title: titleC.text,
                            email: email,
                            context: context,
                            deportment: department,
                            imageUrl: selectedImage);
                      }
                    }
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
