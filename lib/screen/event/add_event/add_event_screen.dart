import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

import '../../../admin_side/admin_dashboard/firebase_services/university_event.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final descriptionC = TextEditingController();
  final titleC = TextEditingController();
  final timeC = TextEditingController();
  final dateC = TextEditingController();
  final placeC = TextEditingController();
  final _key = GlobalKey<FormState>();
  Uint8List? selectedImage;

  pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      selectedImage = await image!.readAsBytes();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
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
                                image: MemoryImage(
                                  selectedImage!,
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
                  keyboardType: TextInputType.text,
                  controller: titleC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter title of the event';
                    }
                    return null;
                  },
                  hintText: 'Title of the event',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  keyboardType: TextInputType.text,
                  controller: descriptionC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter detail about the event';
                    } else if (e.length < 50) {
                      return 'Detail must be grater the 100 character';
                    }
                    return null;
                  },
                  maxLines: 5,
                  hintText: 'Description about event',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  keyboardType: TextInputType.text,
                  controller: timeC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter event time';
                    }
                    return null;
                  },
                  hintText: 'Event time',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  keyboardType: TextInputType.text,
                  controller: dateC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter event date';
                    }
                    return null;
                  },
                  hintText: 'Event date',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  keyboardType: TextInputType.text,
                  controller: placeC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter event place';
                    }
                    return null;
                  },
                  hintText: 'Event venue',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  title: 'Add Event',
                  onTap: () async {
                    if (selectedImage == null) {
                      await EasyLoading.showError('Image required');
                    } else {
                      if (_key.currentState!.validate()) {
                        await UniversityEvent.addEventAdmin(
                          context: context,
                          date: dateC.text,
                          imageUrl: selectedImage,
                          time: timeC.text,
                          place: placeC.text,
                          title: titleC.text,
                          description: descriptionC.text,
                        );
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
