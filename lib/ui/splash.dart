import 'dart:async';

import 'package:flutter/material.dart';
import 'package:relic/ui/onboard.dart';
import 'package:relic/util/global.dart';

class Splash extends StatefulWidget {
  static String route = '/';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    hideUIOverlay();
    initialize();
  }

  Future<Timer> initialize() async {
    return Timer(
      Duration(milliseconds: 1500),
      () => Navigator.of(context).pushReplacementNamed(OnBoard.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 175,
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Colors.grey[200],
                offset: Offset(10.0, 10.0),
                spreadRadius: 3,
              )
            ],
            color: secondColor,
          ),
          child: Center(
            child: Text('R', style: splashTextStyle),
          ),
        ),
      ),
    );
  }
}
