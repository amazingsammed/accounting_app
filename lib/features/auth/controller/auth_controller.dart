


import 'package:accounting/features/auth/domain/entites/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../shared/error/failure.dart';
import '../../../shared/network/network.dart';
import '../../../shared/ui/snackbars.dart';


class AuthController extends GetxController{

  var loading = false.obs;
  Future<void> signInWithGoogle() async {
    loading.value = true;
    final results = await continueWithGoogle();
    results.fold((failure) {
      loading.value = false;
      showErrorSnackbar(message: failure.message);
    }, (exists) {
     // showSuccessSnackbar(message: "Login Successful");
      loading.value = false;
    });
  }
}

Future<Either<Failure, bool>> continueWithGoogle() async {
  Profile profile = Profile.empty();
  // create an account with
  try {
    if (!await NetworkInfoImpl().hasInternet()) {
      return Left(Failure('no_internet'.tr));
    }

    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    // Get the GoogleSignInAuthentication
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    // Create the credential
    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // Sign in with the credential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final copiedProfile = profile.copyWith(
      userid: userCredential.user!.uid,
      email: userCredential.user!.email!,
      username: userCredential.user!.displayName!,
      image: userCredential.user!.photoURL,
    );

    final results = await FirebaseFirestore.instance.collection('profiles').doc(copiedProfile.userid).get();
    final userExists = results.exists;

    if (userExists) {
      final results = await FirebaseFirestore.instance.collection('profiles').doc(copiedProfile.userid).get();
      final appUser = Profile.fromMap(results.data()!);
    } else {
        await FirebaseFirestore.instance
          .collection('profiles')
          .doc(copiedProfile.userid)
          .set(copiedProfile.toMap(), SetOptions(merge: true));
    }
    return Right(userExists);
  } catch (error) {
    print(error);
    return const Left(Failure('Error signing in with Google'));
  }
}