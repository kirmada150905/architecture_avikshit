import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyProvider extends StateNotifier<bool> {
  MyProvider() : super(true);

  // Method to update the provider value based on some condition
  void updateValue(bool newValue) {
    state = newValue;
  }
}

final myProvider =
    StateNotifierProvider<MyProvider, bool>((ref) => MyProvider());
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

void handleSignIn(BuildContext context, WidgetRef ref) async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    
    /* 
      set MyProvider state to true to display 
      login button instead of circle progress indicator
      in LoginScreen
    */
    if (googleUser == null) return; // User canceled sign-in
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null) {
      print(user.displayName);
      print(user.photoURL);
      
      /* change to ref.read for updating */
      ref.watch(nameProvider.notifier).state = user.displayName!;
      ref.watch(imageProvider.notifier).state = user.photoURL!;
      context.goNamed("home");
    }
  } catch (e) {
    print("Error during Google Sign-In: $e");
  }
}

final nameProvider = StateProvider<String>((ref) {
  return '';
});
final imageProvider = StateProvider<String>((ref) {
  return '';
});
