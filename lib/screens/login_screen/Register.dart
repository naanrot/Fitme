import 'dart:io' show Platform;
import 'package:demo_homepage/constants/UIconst.dart';
import 'package:demo_homepage/utils/saved_data.dart';
import 'package:demo_homepage/main.dart';
import 'package:demo_homepage/scaffold_nav_bar.dart';
import 'package:demo_homepage/screens/user_info_data/BMIscreen.dart';
import 'package:demo_homepage/widgets/DefaultButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class Register extends StatefulWidget {
  static const String id = "register";
  /*BuildContext context;

  Register(context) { this.context = context; }*/

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = "";
  String _password = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  final SavedData _data = SavedData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                      text: "Register",
                      function: () async {
                        try {

                          if (_email != "" && _password != "") {
                            //Connect to firebase sign in
                            await _auth.createUserWithEmailAndPassword(email: _email, password: _password);

                            //Wait for user account
                            FirebaseUser user = await _auth.currentUser();

                            //Pass the id from firebase to server
                            bool successful = await _data.saveData(user.uid);

                            if (successful) {
                              Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                  MainLayoutBuilder.id,
                                      (Route<dynamic> route) => false);
                            } else {
                              Fluttertoast.showToast(
                                msg: "Could not connect to server",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                fontSize: 16,
                                backgroundColor: kDefaultColor,
                                textColor: kActiveColor,
                              );
                            }
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
                            msg: e.message,
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
