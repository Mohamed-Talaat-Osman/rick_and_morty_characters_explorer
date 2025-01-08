import 'package:flutter/material.dart';

class GoTo {
  static final GlobalKey<NavigatorState> _navigationKey =
  GlobalKey<NavigatorState>();

  // Add this navigation key to MaterialApp
  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;


  // go to screen and pass data to constructor
  static Future<dynamic>? screen(Widget screen, [BuildContext? context]) {
    return context != null
        ? Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => screen)) :
    _navigationKey.currentState?.push(MaterialPageRoute(builder: (context) => screen));
  }

  // go to screen and remove until and pass data to constructor
  static Future<dynamic>? screenAndRemoveUntil(dynamic screen,
      [BuildContext? context]) {
    return context != null
        ? Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
            (Route<dynamic> route) => false)
        : _navigationKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
            (Route<dynamic> route) => false);
  }

  // go to screen and replace old and pass data to constructor
  static Future<dynamic>? screenAndReplacement(dynamic screen,
      [BuildContext? context]) {
    return context != null
        ? Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => screen))
        : _navigationKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  static void goBack() {
    return _navigationKey.currentState?.pop();
  }
}
