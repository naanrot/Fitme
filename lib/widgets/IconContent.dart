import 'package:demo_homepage/constants/UIconst.dart';
import 'package:flutter/material.dart';

const defaultIconSize = 80.0;

class IconContent extends StatelessWidget {

  IconContent({this.icon, this.label, @required this.defaultColor});

  final IconData icon;
  final String label;
  final defaultColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: defaultIconSize,
          color: defaultColor,
        ),

        SizedBox(
          height: 10,
        ),

        Text(
          label,
          style: defaultColor==kActiveColor?kActiveSwitchStyle:kTextStyle,
        )

      ],
    );
  }

}