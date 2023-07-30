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

      context.goNamed("home", pathParameters: {
        'name': user.displayName!,
        'url': user.photoURL!
      }); //TODO:
      // Navigate to the next page and pass the user's display name and photo URL
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomeScreen(
      //         name: user.displayName,
      //         imageUrl: user.photoURL,
      //       ),
      //     ),
      //   );
    }
  } catch (e) {
    print("Error during Google Sign-In: $e");
  }
}
