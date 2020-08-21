import 'package:flutter/material.dart';

const kTextFieldBorderLayout = InputDecoration(
  hintText: 'Enter your password.',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const Color kDefaultColor = Color(0xFF1D1F33);
const Color kBottomContainerColor = Color(0xFFEB1555);
const Color kDefaultSwitchColor = Color(0xFF8C8F9B);
const Color kActiveColor = Colors.white;

const kTextStyle = TextStyle(
  color: kDefaultSwitchColor,
  fontSize: 15,
);

const kActiveSwitchStyle = TextStyle(
  color: kActiveColor,
  fontSize: 15,
);

const kNumberTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const kCalculateText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const kWeightIndicator = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w300
);