import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final firstColor = Color(0xFFF4B158);
final secondColor = Color(0xFFF2768E);
final thirdColor = Color(0xFF0184DE);

final splashTextStyle =
    TextStyle(color: Colors.white, fontSize: 150, fontWeight: FontWeight.bold);

final onboardWidgetDuration = Duration(milliseconds: 500);

showUIOverlay() {
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}
