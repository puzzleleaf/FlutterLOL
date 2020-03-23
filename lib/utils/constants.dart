import 'package:flutter/material.dart';

class Constants {
  static const BaseChampionImagePath = 'http://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/';
  static const BaseSplashImagePath = 'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/';
  static const BaseLoadingImagePath = 'http://ddragon.leagueoflegends.com/cdn/img/champion/loading/';

  static const Color lightPrimary = Colors.white;
  static const Color darkPrimary = Colors.black;
  static const Color lightAccent = Colors.black;
  static const Color darkAccent = Colors.white;
  static const Color lightBG = Colors.white;
  static const Color darkBG = Colors.black;


  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    cursorColor: lightAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
  );
}