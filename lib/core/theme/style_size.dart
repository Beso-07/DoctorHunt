import 'package:flutter/material.dart';

class AppFontStyle {
  static final AppFontWeight fontWeights = AppFontWeight();

  static final AppFontFamily fontFamily = AppFontFamily();
}

// ========================= Font Families ========================= //

class AppFontFamily {
  static const String sfPro = 'SFProDisplay';

  static const String poppins = 'Poppins';

  static const String inter = 'Inter';

  static const String outfit = 'Outfit';
}

// ========================= Font Weights ========================= //

class AppFontWeight {
  final FontWeight thin;
  final FontWeight extraLight;
  final FontWeight light;
  final FontWeight regular;
  final FontWeight medium;
  final FontWeight semiBold;
  final FontWeight bold;
  final FontWeight extraBold;
  final FontWeight black;

  AppFontWeight({
    this.thin = FontWeight.w100,

    this.extraLight = FontWeight.w200,

    this.light = FontWeight.w300,

    this.regular = FontWeight.w400,

    this.medium = FontWeight.w500,

    this.semiBold = FontWeight.w600,

    this.bold = FontWeight.w700,

    this.extraBold = FontWeight.w800,

    this.black = FontWeight.w900,
  });
}
