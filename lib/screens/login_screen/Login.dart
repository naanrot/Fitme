import 'package:demo_homepage/constants/UIconst.dart';
import 'package:demo_homepage/main.dart';
import 'package:demo_homepage/scaffold_nav_bar.dart';
import 'package:demo_homepage/widgets/DefaultButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class Login extends StatefulWidget {
  /*BuildContext context;

  Login(BuildContext context) {
    this.context = context;
  }*/

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String _email = "", _password = "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Icon(
                  Icons.directions_bike,
                  size: 200,
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      onChanged: (value) {
                        _email = value;
                      },
                      decoration: kTextFieldBorderLayout.copyWith(
                        hintText: "Enter email",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        _password = value;
                      },
                      decoration: kTextFieldBorderLayout.copyWith(
                        hintText: "Enter password",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: DefaultButton(
                      text: "Log In",
                      function: () async {
                        try {

                          if (_email != "" && _password != "") {
                            await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                MainLayoutBuilder.id, (Route<dynamic> route) => false);
                          } else {
                            Fluttertoast.showToast(
                              msg: "Email or password field is empty",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              fontSize: 16,
                              backgroundColor: kDefaultColor,
                              textColor: kActiveColor,
                            );
                          }

                        } on PlatformException catch (e) {
                          authProblems errorType;
                          Fluttertoast.showToast(
                            msg: e.message.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            fontSize: 16,
                            backgroundColor: kDefaultColor,
                            textColor: kActiveColor,
                          );
                          if (Platform.isAndroid) {
                            switch (e.message) {
                              case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                                errorType = authProblems.UserNotFound;
                                break;
                              case 'The password is invalid or the user does not have a password.':
                                errorType = authProblems.PasswordNotValid;
                                break;
                              case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                                errorType = authProblems.NetworkError;
                                break;
                              // ...
                              default:
                                print(
                                    'Case ${e.message} is not yet implemented');
                            }
                          } else if (Platform.isIOS) {
                            switch (e.code) {
                              case 'Error 17011':
                                errorType = authProblems.UserNotFound;
                                break;
                              case 'Error 17009':
                                errorType = authProblems.PasswordNotValid;
                                break;
                              case 'Error 17020':
                                errorType = authProblems.NetworkError;
                                break;
                              // ...
                              default:
                                print(
                                    'Case ${e.message} is not yet implemented');
                            }
                          }
                          print('The error is $errorType');
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
