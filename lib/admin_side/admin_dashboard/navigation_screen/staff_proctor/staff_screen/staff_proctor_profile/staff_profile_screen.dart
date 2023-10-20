import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

class StaffProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String department;
  final String phoneNumber;

  const StaffProfileScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.department,
      required this.phoneNumber});

  @override
  State<StaffProfileScreen> createState() => _StaffProfileScreenState();
}

class _StaffProfileScreenState extends State<StaffProfileScreen> {
  Uint8List? selectImage;
  pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);

    selectImage = await image!.readAsBytes();

    setState(() {});
  }

  bool visibility = true;
  bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
              leading: const Icon(Icons.camera_alt),
              title: const ReusableText(
                title: 'Gallery',
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Proctor Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 75,
                    backgroundColor: AppColor.primaryColor,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        selectImage == null ? null : MemoryImage(selectImage!),
                    backgroundColor: AppColor.greyColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 110),
                    child: InkWell(
                      onTap: () {
                        bottomSheet();
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColor.blackColor,
                        radius: 20,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ReusableText(
                title: widget.name,
                size: 17,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              ReusableText(
                title: widget.email,
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableCard(
                title: 'Department',
                subtitle: widget.department,
              ),
              SizedBox(
                height: 20,
              ),
              ReusableCard(
                title: 'Phone Number',
                subtitle: widget.phoneNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const ReusableCard({
    super.key,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Card(
          color: AppColor.greyColor.shade200,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    title: title ?? 'title',
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ReusableText(
                    title: subtitle ?? 'subtitle',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
