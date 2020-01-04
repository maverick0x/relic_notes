import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:relic/util/global.dart';

class NoteView extends StatelessWidget {
  static String route = '/noteview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.8,
            child: Hero(
              tag: 'note-container',
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [firstColor, Colors.white.withOpacity(0.5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Hero(
                  tag: 'time-row',
                  child: Row(
                    children: <Widget>[
                      Icon(LineAwesomeIcons.clock_o, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('11:13 PM',
                          style: Theme.of(context).textTheme.subtitle),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Hero(
                  tag: 'date-row',
                  child: Row(
                    children: <Widget>[
                      Icon(LineAwesomeIcons.calendar, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('21/02/19',
                          style: Theme.of(context).textTheme.subtitle),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height * 0.2) + 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'note-title',
                    child: Text(
                      'A dummy title created to see what the notes ' +
                          'app will look like',
                      style: Theme.of(context).textTheme.title.merge(
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    child: Hero(
                      tag: 'note-content',
                      child: Text(
                        'This is a sample subtitle created to see ' +
                            'what the notes app will look like. I ' +
                            'got the inspiration from a novel which ' +
                            'helped shapen my determination more...',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
