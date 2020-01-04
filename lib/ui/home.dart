import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:relic/ui/note_view.dart';
import 'package:relic/util/global.dart';

class Home extends StatelessWidget {
  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 5,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height - 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(LineAwesomeIcons.navicon),
                          onPressed: () {}),
                      SizedBox(width: 10),
                      Text(
                        'Notes',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(LineAwesomeIcons.search),
                          onPressed: () {}),
                      SizedBox(width: 5),
                      IconButton(
                          icon: Icon(LineAwesomeIcons.user), onPressed: () {})
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 70,
              left: 0,
              right: 0,
              bottom: 0,
              child: Notes(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 200,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white54.withAlpha(0), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(LineAwesomeIcons.pencil),
        elevation: 10,
        onPressed: () {},
      ),
    );
  }
}

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return Future.delayed(Duration(milliseconds: 3000));
      },
      child: ListView(
        children: <Widget>[
          SizedBox(height: 5),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(NoteView.route),
            child: Container(
              height: 150,
              margin: EdgeInsets.only(right: 24, left: 24, bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 2,
                    color: Colors.black12,
                    offset: Offset(-1.5, 1.5),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, left: 16.0, right: 16.0, bottom: 4.0),
                          child: Hero(
                            tag: 'note-title',
                            child: Text(
                              'A dummy title created to see what the notes ' +
                                  'app will look like',
                              style: Theme.of(context).textTheme.title.merge(
                                    TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 4.0),
                          child: Hero(
                            tag: 'note-content',
                            child: Text(
                              'This is a sample subtitle created to see ' +
                                  'what the notes app will look like. I ' +
                                  'got the inspiration from a novel which ' +
                                  'helped shapen my determination more...',
                              style: Theme.of(context).textTheme.subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Hero(
                                tag: 'time-row',
                                child: Row(
                                  children: <Widget>[
                                    Icon(LineAwesomeIcons.clock_o,
                                        color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text('11:13 PM',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle),
                                  ],
                                ),
                              ),
                              Hero(
                                tag: 'date-row',
                                child: Row(
                                  children: <Widget>[
                                    Icon(LineAwesomeIcons.calendar,
                                        color: Colors.grey),
                                    SizedBox(width: 4),
                                    Text('21/02/19',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Hero(
                      tag: 'note-container',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            colors: [firstColor.withOpacity(0.3), firstColor],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.only(right: 24, left: 24, bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 2,
                  color: Colors.black12,
                  offset: Offset(-1.5, 1.5),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8.0, left: 16.0, right: 16.0, bottom: 4.0),
                        child: Text(
                          'A dummy title created to see what the notes ' +
                              'app will look like',
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 4.0),
                        child: Text(
                          'This is a sample subtitle created to see ' +
                              'what the notes app will look like. I ' +
                              'got the inspiration from a novel which ' +
                              'helped shapen my determination more...',
                          style: Theme.of(context).textTheme.subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(LineAwesomeIcons.clock_o,
                                    color: Colors.grey),
                                SizedBox(width: 4),
                                Text('11:13 PM',
                                    style:
                                        Theme.of(context).textTheme.subtitle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(LineAwesomeIcons.calendar,
                                    color: Colors.grey),
                                SizedBox(width: 4),
                                Text('21/02/19',
                                    style:
                                        Theme.of(context).textTheme.subtitle),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [secondColor.withOpacity(0.3), secondColor],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.only(right: 24, left: 24, bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 2,
                  color: Colors.black12,
                  offset: Offset(-1.5, 1.5),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8.0, left: 16.0, right: 16.0, bottom: 4.0),
                        child: Text(
                          'A dummy title created to see what the notes ' +
                              'app will look like',
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 4.0),
                        child: Text(
                          'This is a sample subtitle created to see ' +
                              'what the notes app will look like. I ' +
                              'got the inspiration from a novel which ' +
                              'helped shapen my determination more...',
                          style: Theme.of(context).textTheme.subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(LineAwesomeIcons.clock_o,
                                    color: Colors.grey),
                                SizedBox(width: 4),
                                Text('11:13 PM',
                                    style:
                                        Theme.of(context).textTheme.subtitle),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(LineAwesomeIcons.calendar,
                                    color: Colors.grey),
                                SizedBox(width: 4),
                                Text('21/02/19',
                                    style:
                                        Theme.of(context).textTheme.subtitle),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [thirdColor.withOpacity(0.3), thirdColor],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
