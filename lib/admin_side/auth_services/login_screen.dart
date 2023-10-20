import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proctorialboard/admin_side/auth_services/auth_services.dart';
import 'package:proctorialboard/themes/color.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

class LogInScreenAdmin extends StatefulWidget {
  const LogInScreenAdmin({super.key});

  @override
  State<LogInScreenAdmin> createState() => _LogInScreenAdminState();
}

class _LogInScreenAdminState extends State<LogInScreenAdmin> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Log In',
                      style: GoogleFonts.kanit(
                          textStyle: const TextStyle(
                              color: AppColor.yellowColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 50))),
                  SizedBox(
                    height: 50,
                  ),
                  ReusableTextForm(
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailC,
                    hintText: 'Email',
                    validator: (e) {
                      if (e!.isEmpty || !e.contains('@')) {
                        return 'Email badly Formatted';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: const Icon(
                      Icons.email,
                      color: AppColor.greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableTextForm(
                      textCapitalization: TextCapitalization.none,
                      controller: passwordC,
                      obscureText: obscure,
                      hintText: 'Password',
                      validator: (e) {
                        if (e!.isEmpty || e.length < 6) {
                          return 'Password badly Formatted';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColor.greyColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: obscure
                            ? Icon(
                                Icons.visibility_off,
                                color: obscure
                                    ? AppColor.greyColor
                                    : AppColor.greyColor,
                              )
                            : Icon(
                                Icons.visibility,
                                color: obscure
                                    ? AppColor.greyColor
                                    : AppColor.greyColor,
                              ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ReusableButton(
                      title: 'LogIn',
                      onTap: () async {
                        if (_key.currentState!.validate()) {
                          await AuthServicesForAdmin.signInAdmin(
                              email: emailC.text,
                              password: passwordC.text,
                              context: context);
                        }
                      },
                      buttonColor: AppColor.primaryColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
