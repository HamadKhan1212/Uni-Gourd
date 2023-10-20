// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:proctorialboard/wedgits/reusable_button.dart';
// import 'package:proctorialboard/wedgits/reusable_textformfield.dart';
//
// import '../../auth_screen/auth_services.dart';
//
// class SignUpAnonymously extends StatefulWidget {
//   const SignUpAnonymously({super.key});
//
//   @override
//   State<SignUpAnonymously> createState() => _SignUpAnonymouslyState();
// }
//
// class _SignUpAnonymouslyState extends State<SignUpAnonymously> {
//   bool obscure = false;
//   TextEditingController nameC = TextEditingController();
//   TextEditingController emailC = TextEditingController();
//   TextEditingController passwordC = TextEditingController();
//   TextEditingController phoneNumberC = TextEditingController();
//   TextEditingController deportmentC = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('Sign Up',
//                     style: GoogleFonts.kanit(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 30))),
//                 ReusableTextForm(
//                   controller: nameC, // Assign the name controller
//                   hintText: 'Name', // Assuming this is the name field
//                   prefixIcon: Icon(
//                     Icons.person,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ReusableTextForm(
//                   controller: deportmentC, // Assign the name controller
//                   hintText: 'Deportment', // Assuming this is the name field
//                   prefixIcon: Icon(
//                     Icons.person,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ReusableTextForm(
//                   controller: phoneNumberC, // Assign the name controller
//                   hintText: 'Contact Number', // Assuming this is the name field
//                   prefixIcon: Icon(
//                     Icons.person,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ReusableTextForm(
//                   textCapitalization: TextCapitalization.none,
//                   controller: emailC, // Assign the email controller
//                   hintText: 'Email',
//                   prefixIcon: Icon(
//                     Icons.email,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ReusableTextForm(
//                   textCapitalization: TextCapitalization.none,
//                   controller: passwordC, // Assign the password controller
//                   obscureText: obscure,
//                   hintText: 'Password',
//                   prefixIcon: const Icon(
//                     Icons.lock,
//                     color: Colors.black,
//                   ),
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         obscure = !obscure;
//                       });
//                     },
//                     icon: obscure
//                         ? Icon(
//                             Icons.visibility_off,
//                             color: obscure ? Colors.black12 : Colors.teal,
//                           )
//                         : Icon(
//                             Icons.visibility,
//                             color: obscure ? Colors.black12 : Colors.teal,
//                           ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ReusableButton(
//                   title: 'SignUp',
//                   onTap: () async {
//                     await AuthServices.createUserAnonymously(
//                       context: context,
//                       name: nameC.text,
//                       email: emailC.text,
//                       password: passwordC.text,
//                       phoneNumber: phoneNumberC.text,
//                       deportment: deportmentC.text,
//                     );
//                   },
//                   buttonColor: Colors.black,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
