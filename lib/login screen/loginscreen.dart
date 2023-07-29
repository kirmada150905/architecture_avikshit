import 'package:architecture_avikshit/constants/colors.dart';
import 'package:architecture_avikshit/constants/textstyles.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/assets.dart';

final myProvider =
    StateNotifierProvider<MyProvider, bool>((ref) => MyProvider());

class LoginScreen extends ConsumerWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _handleSignIn(BuildContext context, WidgetRef ref) async {
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

        context.goNamed("home",
            pathParameters: {'name': user.displayName!, 'url': user.photoURL!});
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool providerValue = ref.watch(myProvider);
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Text("The only\nshopping app\nyou'll ever need. ",
                  //style: w800.size36.colorWhite,
                  style: GoogleFonts.archivoBlack(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),

              //SizedBox(height: 16),
              Expanded(child: Container()),
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.8, // 80% of screen width
                child: GestureDetector(
                  onTap: () {
                    _handleSignIn(context, ref);
                    //context.go("/home");
                  },
                  child: providerValue
                      ? Container(
                          height: 50.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.blue.withOpacity(
                                0.2), // Customize the button color here
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                PngAssets
                                    .googleButton, // Replace this with your Google logo image
                                height: 24.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Sign in with Google',
                                style: w500.size15.copyWith(
                                    color: Colors.white.withOpacity(0.9)),
                                // style: w500.size15.copyWith(color: Colors.grey[900]),
                              ),
                            ],
                          ),
                        )
                      : CircularProgressIndicator(),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyProvider extends StateNotifier<bool> {
  MyProvider() : super(true);

  // Method to update the provider value based on some condition
  void updateValue(bool newValue) {
    state = newValue;
  }
}
