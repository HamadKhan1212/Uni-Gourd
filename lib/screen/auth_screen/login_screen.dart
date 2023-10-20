import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proctorialboard/screen/auth_screen/auth_services.dart';
import 'package:proctorialboard/screen/auth_screen/sign_up.dart';
import 'package:proctorialboard/wedgits/reusable_button.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';
import 'package:proctorialboard/wedgits/reusable_textformfield.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Log In',
                    style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30))),
                SizedBox(
                  height: 80,
                ),
                ReusableTextForm(
                  textCapitalization: TextCapitalization.none,
                  controller: emailC,
                  hintText: 'Email',
                  validator: (e) {
                    if (e!.isEmpty || !e.contains('@')) {
                      return 'email badly Formatted';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
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
                      color: Colors.black,
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
                              color: obscure ? Colors.black12 : Colors.teal,
                            )
                          : Icon(
                              Icons.visibility,
                              color: obscure ? Colors.black12 : Colors.teal,
                            ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ReusableButton(
                  title: 'LogIn',
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      await AuthServices.signInUser(
                        context: context,
                        email: emailC.text,
                        password: passwordC.text,
                      );
                    }
                  },
                  buttonColor: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SignUpAnonymously()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ReusableText(
                        title: 'Don\'t have an account?  ',
                      ),
                      ReusableText(
                        title: 'Signin',
                        color: Colors.blue,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
