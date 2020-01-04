import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:relic/bloc/onboard_bloc.dart';
import 'package:relic/util/global.dart';

import 'register.dart';

class OnBoard extends StatelessWidget {
  static String route = '/onboard';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardBloc>(
      create: (context) => OnBoardBloc(),
      child: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  OnBoardBloc _onboardBloc;

  @override
  void initState() {
    super.initState();
    _onboardBloc = BlocProvider.of<OnBoardBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardBloc, int>(
        builder: (context, currentIndex) {
          return Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.width * 0.3,
                child: PageView(
                  children: <Widget>[
                    // Page One
                    CustomPaint(
                      painter: OnBoardPainter(firstColor.withOpacity(0.7)),
                      child: Column(
                        children: <Widget>[
                          Spacer(flex: 1),
                          Icon(
                            LineAwesomeIcons.pencil,
                            color: Colors.white,
                            size: 128,
                          ),
                          Spacer(flex: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 48,
                              vertical: 16,
                            ),
                            child: Text(
                              'Welcome, we are glad to see you here.' +
                                  ' Now you can create notes for free.',
                              style: Theme.of(context).textTheme.headline,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                    // Page Two
                    CustomPaint(
                      painter: OnBoardPainter(secondColor.withOpacity(0.7)),
                      child: Column(
                        children: <Widget>[
                          Spacer(flex: 1),
                          Icon(
                            LineAwesomeIcons.cloud_upload,
                            color: Colors.white,
                            size: 128,
                          ),
                          Spacer(flex: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 48,
                              vertical: 16,
                            ),
                            child: Text(
                              'We provide write once, retrieve anytime feature.' +
                                  ' We ensure your notes are safely kept.',
                              style: Theme.of(context).textTheme.headline,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                    // Page Three
                    CustomPaint(
                      painter: OnBoardPainter(thirdColor.withOpacity(0.5)),
                      child: Column(
                        children: <Widget>[
                          Spacer(flex: 1),
                          Icon(
                            LineAwesomeIcons.file_text,
                            color: Colors.white,
                            size: 128,
                          ),
                          Spacer(flex: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 48,
                              vertical: 16,
                            ),
                            child: Text(
                              'We provide access to bookmark important notes.' +
                                  ' Making your notes accessible offline.',
                              style: Theme.of(context).textTheme.headline,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ],
                  onPageChanged: (index) {
                    if (index > currentIndex)
                      _onboardBloc.add(OnBoardEvent.increment);
                    else
                      _onboardBloc.add(OnBoardEvent.decrement);
                  },
                  pageSnapping: true,
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.width * 0.2,
                left: (MediaQuery.of(context).size.width - 160) / 2,
                right: (MediaQuery.of(context).size.width - 160) / 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      AnimatedContainer(
                        width: 40,
                        height: 10,
                        duration: onboardWidgetDuration,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: currentIndex == 0
                              ? firstColor.withOpacity(0.85)
                              : Colors.grey[300],
                        ),
                      ),
                      AnimatedContainer(
                        width: 40,
                        height: 10,
                        duration: onboardWidgetDuration,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: currentIndex == 1
                              ? secondColor.withOpacity(0.85)
                              : Colors.grey[300],
                        ),
                      ),
                      AnimatedContainer(
                        width: 40,
                        height: 10,
                        duration: onboardWidgetDuration,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: currentIndex == 2
                              ? thirdColor.withOpacity(0.85)
                              : Colors.grey[300],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: onboardWidgetDuration,
                bottom: 0,
                right: currentIndex == 2 ? 0 : -200,
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(Register.route),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 16, right: 10, left: 25),
                    decoration: BoxDecoration(
                      color: thirdColor.withOpacity(0.85),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: Text(
                      'DONE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class OnBoardPainter extends CustomPainter {
  final color;

  OnBoardPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height / 2;
    final path = Path();
    final paint = Paint()..color = color;
    path.lineTo(0, height * 0.6);
    path.quadraticBezierTo(width / 2, height, width, height * 0.6);
    path.lineTo(width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
