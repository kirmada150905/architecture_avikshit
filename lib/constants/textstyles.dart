import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension StyleExt on TextStyle {
  TextStyle get size9 => copyWith(fontSize: 9);
  TextStyle get size10 => copyWith(fontSize: 10);
  TextStyle get size11 => copyWith(fontSize: 11);

  TextStyle get size12 => copyWith(fontSize: 12);

  TextStyle get size13 => copyWith(fontSize: 13);

  TextStyle get size14 => copyWith(fontSize: 14);

  TextStyle get size15 => copyWith(fontSize: 15);

  TextStyle get size16 => copyWith(fontSize: 16);

  TextStyle get size17 => copyWith(fontSize: 17);

  TextStyle get size18 => copyWith(fontSize: 18);

  TextStyle get size19 => copyWith(fontSize: 19);

  TextStyle get size20 => copyWith(fontSize: 20);

  TextStyle get size21 => copyWith(fontSize: 21);

  TextStyle get size22 => copyWith(fontSize: 22);

  TextStyle get size23 => copyWith(fontSize: 23);

  TextStyle get size24 => copyWith(fontSize: 24);

  TextStyle get size25 => copyWith(fontSize: 25);

  TextStyle get size26 => copyWith(fontSize: 26);

  TextStyle get size28 => copyWith(fontSize: 28);

  TextStyle get size32 => copyWith(fontSize: 32);

  TextStyle get size30 => copyWith(fontSize: 30);

  TextStyle get size36 => copyWith(fontSize: 36);
  TextStyle get size40 => copyWith(fontSize: 40);

  TextStyle get size50 => copyWith(fontSize: 50);

  TextStyle get colorWhite => copyWith(color: const Color(0xffffffff));

  TextStyle get colorBlack => copyWith(color: const Color(0xff000000));

  TextStyle withHeight(double x) => copyWith(height: x);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

final w400 = GoogleFonts.poppins(
    fontSize: 11,
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal);

final w500 = GoogleFonts.poppins(
    fontSize: 11,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal);

final w600 = GoogleFonts.poppins(
    fontSize: 11,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal);

final w800 = GoogleFonts.poppins(
    fontSize: 11,
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.normal);
final w900 = GoogleFonts.poppins(
    fontSize: 11,
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal);

final w700 = GoogleFonts.archivoBlack(
    fontSize: 11,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal);

final v400 = GoogleFonts.archivoBlack(
  fontSize: 11,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

final v500 = GoogleFonts.archivoBlack(
  fontSize: 11,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

final v600 = GoogleFonts.archivoBlack(
  fontSize: 11,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
