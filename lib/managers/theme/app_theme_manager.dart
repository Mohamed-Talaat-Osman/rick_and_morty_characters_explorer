import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters_explorer/managers/theme/textstyles_manager.dart';

import '../../gen/fonts.gen.dart';
import 'colors_manager.dart';

ThemeData appThemeManager() => ThemeData(
    fontFamily: FontFamily.atma,
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
        textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(fontFamily: FontFamily.atma))),
    scaffoldBackgroundColor: ColorsManager.coreAppBackgroundHalanLight1,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: ColorScheme(
      primary: ColorsManager.foundationMainPrimary,
      // focus Color: The most used color in the application
      onPrimary: ColorsManager.foundationMainSecondary,
      // This color is used to color the elements on top of the primary color such as text, icons, etc.

      secondary: ColorsManager.foundationMainWhite,
      // for less prominent elements like filter chips, toggle buttons, or background elements
      onSecondary: ColorsManager.foundationMainWhite,
      // on top of the secondary color such as text, icons, etc.

      error: ColorsManager.foundationAccentDanger,
      // for error messages or alerts, like a flashing red light to indicate a problem.
      onError: ColorsManager.foundationMainWhite,
      // on top of the error color

      surface: ColorsManager.foundationMainWhite,
      // Used as the base color for elevated UI elements like cards, sheets, dialogs, etc.
      onSurface: ColorsManager.coreAppContentPrimary,
      // the elements on top of the surface color.

      brightness: Brightness.light,
    ),
    tabBarTheme: const TabBarTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        enableFeedback: true,
        selectedLabelStyle: TextStylesManager.navTab,
        unselectedLabelStyle: TextStylesManager.navTab,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: ColorsManager.foundationMainWhite,
        unselectedItemColor: ColorsManager.foundationMainSecondary,
        selectedIconTheme: IconThemeData(color: ColorsManager.foundationMainWhite),
        unselectedIconTheme:
            IconThemeData(color: ColorsManager.foundationMainSecondary)));
