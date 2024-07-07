

import 'package:accounting/features/auth/controller/auth_controller.dart';
import 'package:accounting/master.dart';
import 'package:accounting/shared/extensions/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ionicons/ionicons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              return Master();
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return LoginPage();
            }
          }),
    );
  }
}

class LoginPage extends GetView<AuthController> {
   AuthController x = Get.put(AuthController());
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.maxFinite, 50),
                    backgroundColor: Colors.white,foregroundColor: Colors.black
                ),
                onPressed: controller.signInWithGoogle,
                label: Text('Continue With Google'.tr),
                icon:  Icon(Ionicons.logo_google),
              ).withLoading(
                loading: controller.loading,
                text: 'signing_in'.tr,
                icon: const Icon(Ionicons.logo_google),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

