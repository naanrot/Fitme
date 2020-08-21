import 'package:demo_homepage/constants/UIconst.dart';
import 'package:demo_homepage/utils/CalculateBMI.dart';
import 'package:demo_homepage/utils/user_data_save.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  CalculateBMI cal = CalculateBMI();
  final UserSaveData _saveData = UserSaveData();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String dropDownValue = "Maintain weight";

  final Map<String, double> calorieVal = {
    'Maintain weight': 1.0,
    'Mild weight loss': 0.90,
    'Weight loss': 0.79,
    'Extreme weight loss': 0.59,
    'Mild weight gain': 1.10,
    'Weight gain': 1.21,
    'Fast Weight gain': 1.425
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Here your info"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Here your result",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff112d4e),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "BMI: " + cal.bmi.toStringAsFixed(3),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Daily Calories: " + cal.dailyCal.toStringAsFixed(3),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Your BMI category: " + cal.getWeightIndicator(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 10,
                          thickness: 3,
                          indent: 0,
                          endIndent: 0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Choose your motto",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff112d4e),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButton(
                          value: dropDownValue,
                          icon: Icon(Icons.directions_bike),
                          onChanged: (val) {
                            setState(() {
                              dropDownValue = val;
                            });
                          },
                          items: <String>[
                            'Maintain weight',
                            'Mild weight loss',
                            'Weight loss',
                            'Extreme weight loss',
                            'Mild weight gain',
                            'Weight gain',
                            'Fast Weight gain',
                          ].map<DropdownMenuItem<String>>((val) {
                            return DropdownMenuItem(
                              value: val,
                              child: Text(
                                val,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Daily Calories Needed: " +
                              calorieCalculator().toStringAsFixed(3),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: GestureDetector(
                    onTap: () async {
                      FirebaseUser user = await _auth.currentUser();
                      print("User id: " + user.uid);
                      bool isSuccessful = await _saveData.saveData(user.uid, cal.bmi, calorieCalculator(), dropDownValue);

                      if (isSuccessful) {
                        Fluttertoast.showToast(
                          msg: 'Data saved',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          fontSize: 16,
                          backgroundColor: kDefaultColor,
                          textColor: kActiveColor,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Connection Error',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          fontSize: 16,
                          backgroundColor: kDefaultColor,
                          textColor: kActiveColor,
                        );
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'SAVE MY RESULT',
                          style: kCalculateText,
                        ),
                      ),
                      width: double.infinity,
                      color: kBottomContainerColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  double calorieCalculator() {
    double val = calorieVal[dropDownValue];
    return cal.dailyCal * val;
  }
}
