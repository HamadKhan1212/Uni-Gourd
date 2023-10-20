import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

class ProctorProfile extends StatefulWidget {
  const ProctorProfile({super.key});

  @override
  State<ProctorProfile> createState() => _ProctorProfileState();
}

class _ProctorProfileState extends State<ProctorProfile> {
  String? selectImage;
  pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    setState(() {
      selectImage = image!.path;
    });
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
                pickImage(ImageSource.camera);
              },
              leading: const Icon(Icons.camera),
              title: const ReusableText(
                title: 'camera',
              ),
            ),
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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text('Profile'),
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
                    backgroundImage: selectImage == null
                        ? null
                        : FileImage(File(selectImage!)),
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
              const ReusableText(
                title: 'Proctor Name',
                size: 17,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              const ReusableText(
                title: 'proctor123@gmail.com',
              ),
              const SizedBox(
                height: 20,
              ),
              const ReusableCard(
                title: 'Department',
                subtitle: 'Software Engeering',
              ),
              const ReusableCard(
                title: 'semester',
                subtitle: '7th',
              ),
              const ReusableCard(
                title: 'Session',
                subtitle: '2020-2024',
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: 150,
                  child: ReusableButton(title: 'Log Out', onTap: () {})),
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
