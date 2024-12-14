import 'package:flutter/material.dart';

// Arabic Theme ------------

ThemeData themeAr = ThemeData(
  fontFamily: "Kalam",
  textTheme: const TextTheme(
// title text theme
    titleMedium: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w600),

    titleLarge: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold),

    bodyLarge: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w300,
        fontSize: 20),

    bodyMedium: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w300,
        fontSize: 18),

// body text theme
    bodySmall: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w300,
        fontSize: 13),
  ),
);

// English Theme-----------
ThemeData themeEn = ThemeData(
  fontFamily: "Kalam",
  textTheme: const TextTheme(
// ============================ title smail ============================ //
    titleSmall: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w600),

// ============================ title medium ============================ //
    titleMedium: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w600),
// ============================ title large ============================ //
    titleLarge: TextStyle(
        fontSize: 30,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold),

// ============================= body smail ============================== //
    bodySmall: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w400,
        fontSize: 15),
  ),
);
