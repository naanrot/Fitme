import 'dart:math';

import 'package:demo_homepage/screens/user_info_data/BMIscreen.dart';
import 'package:flutter/cupertino.dart';

class CalculateBMI {

  static final CalculateBMI _instance = CalculateBMI._internal();

  int _height;
  int _age;
  int _weight;
  double _exeType;
  double _bmi;
  double _dailyCal;
  Gender _gender;

  factory CalculateBMI() => _instance;

  CalculateBMI._internal();

  double get dailyCal => _dailyCal;

  double get bmi => _bmi;

  calculateBMI() {
    _bmi = _weight/ pow(_height/100, 2);
    print(_bmi.toString());
    _bmi.toStringAsFixed(1);
  }

  setData(a, h, w, exe, Gender gender) {
    _height = h;
    _age = a;
    _weight = w;
    _exeType = exe;
    _gender = gender;
    calculateBMI();
    caloriesCount();
  }

  set exeType(double value) {
    _exeType = value;
  }

  caloriesCount() {
    double bmr;

    if (_gender == Gender.Male)
      bmr = (((10*_weight)+(6.25*_height))-(5*_age))+5;
    else
      bmr = (((10*_weight)+(6.25*_height))-(5*_age)) - 161;

    _dailyCal = bmr * _exeType;
  }

  String getWeightIndicator() {
    if(_bmi < 16)
      return 'Severe Thinness';
    else if(_bmi >= 16 && _bmi <= 17)
      return 'Moderate Thinness';
    else if (_bmi >= 17 && _bmi <= 18.5)
      return 'Mild Thinness';
    else if (_bmi >= 18.5 && _bmi <= 25)
      return 'Normal';
    else if (_bmi >= 25 && _bmi <= 30)
      return 'Overweight';
    else if (_bmi >= 30 && _bmi <= 35)
      return 'Obese Class I';
    else if (_bmi >= 35 && _bmi <= 40)
      return 'Obese Class II';
    else
      return 'Obese Class III';
  }
}