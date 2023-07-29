import 'package:architecture_avikshit/constants/colors.dart';
import 'package:architecture_avikshit/constants/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/assets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    context.go("/home");
                  },
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.cyan
                          .withOpacity(0.8), // Customize the button color here
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
                          style: w500.size15.colorWhite,
                        ),
                      ],
                    ),
                  ),
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
