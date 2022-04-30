import 'package:flutter/material.dart';

import 'dark_palette.dart';
import 'light_palette.dart';

class ThemeGenerator {
  static const _textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: "Roboto",
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: TextStyle(
      fontFamily: "Roboto",
      fontSize: 60,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: TextStyle(
      fontFamily: "Roboto",
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      fontFamily: "Roboto",
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: TextStyle(
      fontFamily: "Roboto",
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontFamily: "Roboto",
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontFamily: "Roboto",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: TextStyle(
      fontFamily: "Roboto",
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: TextStyle(
      fontFamily: "Roboto",
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );

  static ThemeData generate({bool darkMode = false}) {
    final palette = !darkMode ? lightPalette : darkPalette;

    return ThemeData(
      colorScheme: palette.toColorScheme(),
      textTheme: _textTheme.apply(
        displayColor: palette.onBackground,
        bodyColor: palette.onBackground,
        decorationColor: palette.onBackground,
      ),
      primaryColor: palette.primary,
      indicatorColor: palette.primary,
      highlightColor: Colors.black.withOpacity(.25),
      toggleableActiveColor: palette.primary,
      scaffoldBackgroundColor: palette.background,
      popupMenuTheme: PopupMenuThemeData(color: palette.surface),
      dialogBackgroundColor: palette.surface,
      dividerColor: palette.divider,
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: palette.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: palette.onSurface,
        backgroundColor: palette.surface,
        elevation: 0,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: palette.primary,
        unselectedLabelColor: palette.grey,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: palette.surface,
        selectedItemColor: palette.onSurface,
        unselectedItemColor: palette.onSurface,
        selectedLabelStyle: _textTheme.caption,
        unselectedLabelStyle: _textTheme.caption,
      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: palette.surface),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.black.withOpacity(.25),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.resolveWith(
            (states) =>
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.resolveWith(
            (states) =>
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.resolveWith(
            (states) =>
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        splashColor: Colors.black.withOpacity(.25),
      ),
    );
  }
}
