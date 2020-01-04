import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final firstColor = Color(0xFFF4B158);
final secondColor = Color(0xFFF2768E);
final thirdColor = Color(0xFF0184DE);

final primaryColor = Colors.grey[100];

final splashTextStyle =
    TextStyle(color: Colors.white, fontSize: 150, fontWeight: FontWeight.bold);

final onboardWidgetDuration = Duration(milliseconds: 300);

hideUIOverlay() => SystemChrome.setEnabledSystemUIOverlays([]);

showNavigationBar(Color color, Brightness brightness) {
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
    statusBarIconBrightness: brightness,
    systemNavigationBarColor: color,
    systemNavigationBarIconBrightness: brightness,
  ));
}
