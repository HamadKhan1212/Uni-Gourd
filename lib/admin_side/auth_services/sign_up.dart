import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proctorialboard/admin_side/auth_services/auth_services.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/utils/app_utils.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

import '../../wedgits/reusable_text.dart';

class SignUpAdmin extends StatefulWidget {
  const SignUpAdmin({super.key});

  @override
  State<SignUpAdmin> createState() => _SignUpAdminState();
}

class _SignUpAdminState extends State<SignUpAdmin> {
  bool obscure = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(); // Controller for email
  TextEditingController passwordController =
      TextEditingController(); // Controller for password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Sign Up',
                  style: GoogleFonts.kanit(
                      textStyle: const TextStyle(
                          color: AppColor.yellowColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 50))),
              SizedBox(
                height: AppUtils.getHeight(context, 0.05),
              ),
              ReusableTextForm(
                textCapitalization: TextCapitalization.none,
                controller: emailController,
                keyboardType:
                    TextInputType.emailAddress, // Assign the email controller
                hintText: 'Email',
                prefixIcon: Icon(Icons.email, color: AppColor.greyColor),
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableTextForm(
                textCapitalization: TextCapitalization.none,
                controller:
                    passwordController, // Assign the password controller
                obscureText: obscure,
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock, color: AppColor.greyColor),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: obscure
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColor.greyColor,
                        )
                      : Icon(Icons.visibility, color: AppColor.greyColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableTextForm(
                controller: nameController, // Assign the name controller
                hintText: 'Name', // Assuming this is the name field
                prefixIcon: Icon(Icons.person, color: AppColor.greyColor),
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableButton(
                title: 'SignUp',
                onTap: () async {
                  await AuthServicesForAdmin.createAdmin(
                    context: context,
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableText(
                      title: 'Already have account',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ReusableText(
                      color: Colors.blue,
                      weight: FontWeight.bold,
                      title: 'Log In',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
