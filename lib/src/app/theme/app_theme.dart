import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/app/theme/font_family.dart';

class AppTheme {
  static void _onCreateTheme() {
    backgroundColor = Color(0xFFF3F3F3);

    primaryColor = Color(0xFF00629F);
    textPrimaryColor = Color(0xFFFFFFFF);
    secondaryColor = Color(0xFF000000);

    tileSelectedColor = Color(0x220B669F);
    tileUnselectedColor = Color(0xFFFFFFFF);

    iconSelectedColor = Color(0xFF00629F);
    iconUnselectedColor = Color(0xFF000000);

    backgroundAppBar = Color(0xFFFFFFFF);
    bottomNavBar = Color(0xFFFFFFFF);

    drawerIconColor['homeIcon'] = Color(0xFF000000);
    drawerIconColor['hariIniIcon'] = Color(0xFFF44336);
    drawerIconColor['pesanIcon'] = Color(0xFF4CAF50);
    drawerIconColor['todoIcon'] = Color(0xFFFFC107);
    drawerIconColor['noteIcon'] = Color(0xFF03A9F4);

    splashColor = Color(0xFF00629F);
    textSplashColor = Color(0xFFFFFFFF);
  }

  static ThemeData build() {
    _onCreateTheme();
    return ThemeData(
      fontFamily: primaryFontFamily,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: textPrimaryColor),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundAppBar,
        foregroundColor: primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: iconSelectedColor,
        unselectedItemColor: iconUnselectedColor,
        backgroundColor: bottomNavBar,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        headline2: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        headline3: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        headline4: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        headline5: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        headline6: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        bodyText1: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        bodyText2: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
        button: TextStyle(
          color: primaryColor,
          fontFamily: secondaryFontFamily,
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: iconColor,
        textColor: secondaryColor,
      ),
    );
  }
}
