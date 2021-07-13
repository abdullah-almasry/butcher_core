import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final brandLightTheme = ThemeData(
  textTheme: GoogleFonts.cairoTextTheme(),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      centerTitle: true,
      //textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      backwardsCompatibility: true),
  primaryColor: Colors.red[800],
  accentColor: Colors.orange[600],
);
