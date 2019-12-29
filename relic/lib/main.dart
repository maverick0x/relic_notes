import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Relic Notes',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Relic Notes'),
        ),
        body: Center(
          child: Text(
            'Relic Notes',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
  }
}
