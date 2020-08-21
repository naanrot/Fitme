import 'package:demo_homepage/constants/UIconst.dart';
import 'package:demo_homepage/screens/login_screen/LoginMain.dart';
import 'package:demo_homepage/screens/user_info_data/BMIscreen.dart';
import 'package:demo_homepage/utils/CaloriesBloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    //final CaloriesBloc bloc = Provider.of<CaloriesBloc>(context);
    FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserProfile',
        ),
      ),
      body: LayoutBuilder(
        builder:(BuildContext context, BoxConstraints view) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: view.maxHeight,
                  minWidth: view.maxWidth,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        child: Image.asset('images/user.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              try {
                                _auth.signOut().whenComplete(() {
                                  Navigator.of(context).pushNamedAndRemoveUntil(LoginMain.id, (Route<dynamic> route) => false);
                                });
                              } catch (e) {

                              }
                            },
                            child: Container(
                              height: 30,
                                width: view.maxWidth,
                                decoration: BoxDecoration(
                                    color: Color(0xffdbe2ef),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(
                                  child: Text(
                                      "Log out"
                                  ),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BMIscreen()));
                            },
                            child: Container(
                                height: 30,
                                width: view.maxWidth,
                                decoration: BoxDecoration(
                                    color: Color(0xffdbe2ef),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Center(
                                  child: Text(
                                      "Set BMI"
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );}
      )
    );
  }
}
