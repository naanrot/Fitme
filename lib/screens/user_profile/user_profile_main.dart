import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserProfile',
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
              'Coming Soon'
          ),
        ),
      ),
    );
  }
}
