import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:proctorialboard/splash_screen.dart';
import 'package:proctorialboard/themes/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB9oE-o0Q0qshCMmdnx99p-huzfjtWOQtI",
            authDomain: "proctorial-board-uom.firebaseapp.com",
            projectId: "proctorial-board-uom",
            storageBucket: "proctorial-board-uom.appspot.com",
            messagingSenderId: "6699044425",
            appId: "1:6699044425:web:4d1b0639ac557da7e23998"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: AppColor.primaryColor,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600))),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
