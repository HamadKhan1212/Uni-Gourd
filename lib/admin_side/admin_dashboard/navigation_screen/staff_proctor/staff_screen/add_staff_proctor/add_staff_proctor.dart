import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

import '../../../../../../deportment_list.dart';
import '../../../../firebase_services/add_staff.dart';

class AddStaffProctor extends StatefulWidget {
  const AddStaffProctor({super.key});

  @override
  State<AddStaffProctor> createState() => _AddStaffProctorState();
}

class _AddStaffProctorState extends State<AddStaffProctor> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final employeeIdC = TextEditingController();
  final phoneNumberC = TextEditingController();
  String? selectedDeportment;
  final _key = GlobalKey<FormState>();
  String? selectedImage;
  pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Staff Proctor'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
          child: Form(
            key: _key,
            child: (Column(
              children: [
                // InkWell(
                //   onTap: () {
                //     showModalBottomSheet(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               ListTile(
                //                 onTap: () async {
                //                   Navigator.pop(context);
                //                   await pickImage(ImageSource.camera);
                //                 },
                //                 leading: const Icon(Icons.camera),
                //                 title: const Text('Camra'),
                //               ),
                //               ListTile(
                //                 onTap: () async {
                //                   Navigator.pop(context);
                //                   await pickImage(ImageSource.gallery);
                //                 },
                //                 leading: const Icon(Icons.image),
                //                 title: const Text('Gallery'),
                //               )
                //             ],
                //           ),
                //         );
                //       },
                //     );
                //   },
                //   child: Container(
                //     height: 200,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //         image: selectedImage == null
                //             ? null
                //             : DecorationImage(
                //                 fit: BoxFit.cover,
                //                 image: FileImage(
                //                   File(
                //                     selectedImage!,
                //                   ),
                //                 )),
                //         color: AppColor.lightGreyColor,
                //         borderRadius: BorderRadius.circular(10),
                //         border: Border.all(color: AppColor.deepPurple)),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           selectedImage == null
                //               ? Icons.add_a_photo_outlined
                //               : null,
                //           size: 50,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                ReusableTextForm(
                  controller: nameC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter Staff Name';
                    }
                    return null;
                  },
                  hintText: 'Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter Staff Email';
                    }
                    return null;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  textCapitalization: TextCapitalization.none,
                  controller: passwordC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter Staff Password';
                    }
                    return null;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  textCapitalization: TextCapitalization.none,
                  controller: employeeIdC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter Employee Id';
                    }
                    return null;
                  },
                  hintText: 'Employee Id',
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text('Select Deportment'),
                      isExpanded: true,
                      value: selectedDeportment,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDeportment = newValue!;
                        });
                      },
                      items: deportment.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableTextForm(
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberC,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return 'Enter Staff PhoneNumber';
                    }
                    return null;
                  },
                  hintText: 'Phone Number',
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  title: 'Add Staff',
                  buttonColor: AppColor.primaryColor,
                  onTap: () async {
                    // if (selectedImage == null) {
                    //   EasyLoading.showError('Image required');
                    // }
                    if (_key.currentState!.validate()) {
                      await AddUsersFunction.addStaff(
                          context,
                          nameC.text,
                          employeeIdC.text,
                          selectedDeportment,
                          phoneNumberC.text,
                          emailC.text,
                          passwordC.text);
                    }
                  },
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
