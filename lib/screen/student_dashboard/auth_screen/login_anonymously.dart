// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:proctorialboard/screen/student_dashboard/auth_screen/sign_up.dart';
// import 'package:proctorialboard/themes/color.dart';
// import 'package:proctorialboard/wedgits/reusable_button.dart';
// import 'package:proctorialboard/wedgits/reusable_text.dart';
// import 'package:proctorialboard/wedgits/reusable_textformfield.dart';
// import 'package:social_login_buttons/social_login_buttons.dart';
//
// import '../../auth_screen/auth_services.dart';
//
// class LogInAnonymously extends StatefulWidget {
//   const LogInAnonymously({super.key});
//
//   @override
//   State<LogInAnonymously> createState() => _LogInAnonymouslyState();
// }
//
// class _LogInAnonymouslyState extends State<LogInAnonymously> {
//   final emailC = TextEditingController();
//   final passwordC = TextEditingController();
//   final _key = GlobalKey<FormState>();
//   bool obscure = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _key,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('Log In',
//                     style: GoogleFonts.kanit(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 30))),
//                 ReusableTextForm(
//                   textCapitalization: TextCapitalization.none,
//                   keyboardType: TextInputType.emailAddress,
//                   controller: emailC,
//                   hintText: 'Email',
//                   validator: (e) {
//                     if (e!.isEmpty || !e.contains('@')) {
//                       return 'email badly Formatted';
//                     } else {
//                       return null;
//                     }
//                   },
//                   prefixIcon: const Icon(
//                     Icons.email,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ReusableTextForm(
//                     textCapitalization: TextCapitalization.none,
//                     controller: passwordC,
//                     obscureText: obscure,
//                     hintText: 'Password',
//                     validator: (e) {
//                       if (e!.isEmpty || e.length < 6) {
//                         return 'Password badly Formatted';
//                       } else {
//                         return null;
//                       }
//                     },
//                     prefixIcon: const Icon(
//                       Icons.lock,
//                       color: Colors.black,
//                     ),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           obscure = !obscure;
//                         });
//                       },
//                       icon: obscure
//                           ? Icon(
//                               Icons.visibility_off,
//                               color: obscure ? Colors.black12 : Colors.teal,
//                             )
//                           : Icon(
//                               Icons.visibility,
//                               color: obscure ? Colors.black12 : Colors.teal,
//                             ),
//                     )),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ReusableButton(
//                   title: 'LogIn',
//                   onTap: () async {
//                     if (_key.currentState!.validate()) {
//                       await AuthServices.logInAnonymously(
//                           email: emailC.text,
//                           password: passwordC.text,
//                           context: context);
//                     }
//                   },
//                   buttonColor: Colors.black,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ReusableText(
//                       title: 'Don\'t have account',
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     SignUpAnonymously()));
//                       },
//                       child: ReusableText(
//                         color: Colors.blue,
//                         weight: FontWeight.bold,
//                         title: 'Sign Up',
//                       ),
//                     )
//                   ],
//                 ),
//                 SocialLoginButton(
//                   backgroundColor: AppColor.primaryColor,
//                   buttonType: SocialLoginButtonType.google,
//                   onPressed: () async {
//                     await AuthServices.signInWithGoogle(context);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
