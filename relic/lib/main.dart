import 'package:flutter/material.dart';
import 'package:relic/ui/home.dart';
import 'package:relic/ui/login.dart';
import 'package:relic/ui/onboard.dart';
import 'package:relic/ui/register.dart';
import 'package:relic/ui/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splash.route,
      routes: {
        Splash.route: (context) => Splash(),
        OnBoard.route: (context) => OnBoard(),
        Login.route: (context) => Login(),
        Register.route: (context) => Register(),
        Home.route: (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Relic Notes',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.grey,
      ),
    );
  }
}
