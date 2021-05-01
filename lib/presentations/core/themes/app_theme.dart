import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: CustomColors.primaryColorLight,
      primaryVariant: Colors.white38,
      secondary: CustomColors.secondaryColorLight,
    ),
    iconTheme: const IconThemeData(
      color: CustomColors.iconColor,
      size: 40.0,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.lightBG,
        centerTitle: true,
        iconTheme: IconThemeData(color: CustomColors.appBarIcon)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0.0,
      selectedItemColor: CustomColors.selectedBarIcon,
      unselectedItemColor: CustomColors.unselectedBarIcon,
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
    buttonColor: CustomColors.iconColor,
  );
}
