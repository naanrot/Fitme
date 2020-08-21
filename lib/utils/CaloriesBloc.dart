import 'package:flutter/cupertino.dart';

class CaloriesBloc extends ChangeNotifier {
  int _dailyCalories = 0;

  int getDailyCalories() => _dailyCalories;

  void setDailyCalories(int cal) {
    _dailyCalories = cal;
    notifyListeners();
  }
}
