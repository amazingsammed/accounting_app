import 'package:accounting/features/auth/presentation/screens/auth_screen.dart';
import 'package:accounting/master.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //       elevation: WidgetStatePropertyAll(0),
        //       backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        //       side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: Colors.black12)),
        //       shape: WidgetStatePropertyAll<OutlinedBorder>(
        //           RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15)))),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.white),
              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(2),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}


