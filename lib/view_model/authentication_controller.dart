import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_notes_with_firebase_mvvm/utils/routes/routes_name.dart';
import 'package:my_notes_with_firebase_mvvm/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  User? user;
  String userName = '';
  UserCredential? userCredential;
  //firebase initialize
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    //  Add auto login logic

    return firebaseApp;
  }

  //-----------simple google authentication--------//
  //its  only user credential

  Future<UserCredential> googleAuthentication(BuildContext context) async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    userName = userCredential!.additionalUserInfo!.profile!['given_name']
        .toString()
        .toUpperCase();
    log('-------- Acces Token is : ${userCredential!.credential!.accessToken} -------');
    log('-------- Token is : ${userCredential!.credential!.token} -------');
    Navigator.pushNamed(context, KRoutesName.home);
    sharePref.setString(logged, userCredential!.credential!.token.toString());
    sharePref.get(logged);

    update();
    return userCredential!;
  }

  //------gogle authentication with user details---------//
  //google authentication
  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        log(e.toString());
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            log('The account already exists with a different credential.');
          } else if (e.code == 'invalid-credential') {
            log('Error occurred while accessing credentials. Try again.');
          }
        } catch (e) {
          log('Error occurred using Google Sign-In. Try again.');
        }
      }
    }
    update();
    return user;
  }

  //sign out
  Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    SharedPreferences sharePref = await SharedPreferences.getInstance();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut(); //android and ios
        Navigator.pushNamed(context, KRoutesName.landing);
        sharePref.clear();
        update();
      }
      await FirebaseAuth.instance.signOut(); //work withweb
      update();
    } catch (e) {
      log('Error signing out. Try again.');
    }
  }
}
