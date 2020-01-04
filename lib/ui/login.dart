import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:relic/ui/home.dart';
import 'package:relic/ui/register.dart';
import 'package:relic/util/global.dart';

class Login extends StatefulWidget {
  static String route = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;

  @override
  void initState() {
    super.initState();
    showNavigationBar(Colors.white, Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          painter: LoginPainter(),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sign in to your account',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        // Email TextFormField
                        TextFormField(
                          maxLength: 50,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: Theme.of(context).textTheme.body1,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.black45),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.black45),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            prefixIcon: Icon(LineAwesomeIcons.at,
                                color: Colors.black45),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) =>
                              !input.contains('@') ? 'Not a valid email' : null,
                          onSaved: (input) => _email = input,
                          onFieldSubmitted: (input) => _email = input,
                        ),
                        SizedBox(height: 30),
                        // Password TextFormField
                        TextFormField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: Theme.of(context).textTheme.body1,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.black45),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.black45),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            prefixIcon: Icon(LineAwesomeIcons.key,
                                color: Colors.black45),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (input) => input.length < 8
                              ? 'You need at least 8 characters'
                              : null,
                          obscureText: true,
                          onSaved: (input) => _password = input,
                          onFieldSubmitted: (input) => _password = input,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: GestureDetector(
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed(Home.route),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        firstColor.withOpacity(0.5),
                                        firstColor.withOpacity(0.7)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    LineAwesomeIcons.hand_o_right,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(Register.route),
                              child: Text(
                                'Create one',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width * 0.4;
    final height = size.height * 0.7;
    final path = Path();
    final paint = Paint()..color = firstColor.withOpacity(0.7);
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
        width * 0.45, height * 0.25, width * 0.51, height / 2);
    path.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);
    path.quadraticBezierTo(width * 0.03, height * 1.03, -10, height);
    path.close();
    canvas.drawPath(path, paint);

    final paintWidth = size.width;
    final paintHeight = size.height;
    final path2 = Path();
    final paint2 = Paint()..color = secondColor.withOpacity(0.7);
    path2.moveTo(paintWidth, paintHeight * 0.8);
    path2.lineTo(paintWidth, paintHeight * 0.4);
    path2.quadraticBezierTo(paintWidth * 0.65, paintHeight * 0.33,
        paintWidth * 0.7, paintHeight * 0.65);
    path2.quadraticBezierTo(
        paintWidth * 0.775, paintHeight * 0.95, paintWidth, paintHeight);
    path2.lineTo(paintWidth, paintHeight);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
