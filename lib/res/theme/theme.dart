import 'package:flutter/material.dart';

import '../colors.dart';

//this class contain project themedata we can change anything in here
//here we can change any type of text color and any components have set unique color like bottom navigation bar, appbar and scaffold
//we can add dark mode and light mode
//this private varial going with help of get method
//because get method treat with variables in flutter
class KTheme {
  final ThemeData _themeData = ThemeData(
//--------------text theme ---------------//colors<<<<<<<<<<<//
    textTheme: const TextTheme(
      // Only For Colors
      //based on some text colors are hard coded

      labelLarge: TextStyle(color: KColors.kBlack),
      labelMedium: TextStyle(color: KColors.kBlack),
      labelSmall: TextStyle(color: KColors.kGrey),

      bodyLarge: TextStyle(color: KColors.kBlack),
      bodyMedium: TextStyle(color: KColors.kBlack),
      bodySmall: TextStyle(color: KColors.kGrey),

      displayMedium: TextStyle(color: KColors.kWhite),
      displaySmall: TextStyle(color: KColors.kGrey),

      titleMedium: TextStyle(color: KColors.kBlack),
      titleSmall: TextStyle(color: KColors.kGrey),
    ),

//-------------switch color code-------------//
    switchTheme: SwitchThemeData(
      splashRadius: 10,
      thumbColor: MaterialStateProperty.all(KColors.kPrimary),
      trackColor: MaterialStateProperty.all(KColors.kGrey),
    ),

//--------------icon theme datas---------------//
    iconTheme: const IconThemeData(color: KColors.kBlack),
    primaryIconTheme: const IconThemeData(color: KColors.kBlack),

//--------------compponents color code---------------//
    scaffoldBackgroundColor: KColors.kWhite,
    appBarTheme: const AppBarTheme(backgroundColor: KColors.kWhite),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: KColors.kWhite),
//--------------theme datas---------------//
    backgroundColor: KColors.kWhite,
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: KColors.kBlack),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // splashColor:KColors.kTransperent ,
    //highlightColor: KColors.kTransperent,
    //indicatorColor: KColors.kTransperent,
    // canvasColor: KColors.kWhite,

    // primaryColorDark: KColors.kBlack,
    // primaryColor: KColors.kBlack,

//--------------font family---------------//
    fontFamily: 'Poppins',
  );

  ThemeData get theme => _themeData;
}
