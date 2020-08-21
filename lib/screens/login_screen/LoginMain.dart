import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:demo_homepage/screens/login_screen/Login.dart';
import 'package:demo_homepage/screens/login_screen/Register.dart';
import 'package:demo_homepage/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';

class LoginMain extends StatefulWidget {
  static const String id = "LoginMain";
  /*BuildContext context;
  LoginMain(BuildContext context) {
    this.context = context;
  }*/

  @override
  _LoginMainState createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Icon(Icons.directions_bike),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TypewriterAnimatedTextKit(
                    text: ['Fitme'],
                    totalRepeatCount: 1,
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                    speed: Duration(seconds: 2),
                  ),
                )
              ],
            ),
            DefaultButton(
              text: "Log In",
              function: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            DefaultButton (
              text: "Register",
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
