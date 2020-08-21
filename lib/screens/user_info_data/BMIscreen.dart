import 'package:demo_homepage/constants/UIconst.dart';
import 'package:demo_homepage/utils/CalculateBMI.dart';
import 'package:demo_homepage/widgets/ActictyChooserDialog.dart';
import 'package:demo_homepage/widgets/BaseCardDesign.dart';
import 'package:demo_homepage/widgets/IconContent.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ResultScreen.dart';

enum Gender {
  Male, Female
}

class BMIscreen extends StatefulWidget {
  static const String id = "BMIscreen";

  @override
  _BMIscreenState createState() => _BMIscreenState();
}

class _BMIscreenState extends State<BMIscreen> {
  Gender genderSelected;
  int height = 180;
  int weight = 50;
  int age = 30;
  Map<int, String> activityMap = {
    1: "No Exercise",
    2: "Less Exercise",
    3: "Moderate Exercise",
    4: "Daily"
  };
  int currentExercise = 1;
  CalculateBMI cal = CalculateBMI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BaseCardDesign(
                        onPress: () {
                          setState(() {
                            genderSelected = Gender.Male;
                          });
                        },
                        color: kDefaultColor,
                        childWidget: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                          defaultColor: genderSelected == Gender.Male
                              ? kActiveColor
                              : kDefaultSwitchColor,
                        ),
                      ),
                    ),

                    Expanded(
                      child: BaseCardDesign(
                        onPress: () {
                          setState(() {
                            genderSelected = Gender.Female;
                          });
                        },
                        color: kDefaultColor,
                        childWidget: IconContent(
                          defaultColor: genderSelected == Gender.Female
                              ? kActiveColor
                              : kDefaultSwitchColor,
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                flex: 2,
                child: BaseCardDesign(
                  onPress: () {},
                  color: kDefaultColor,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kTextStyle,
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kTextStyle,
                            ),
                          ],
                        ),
                      ),

                      /*

                    Customize only one slider using below method

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kBottomContainerColor,
                        overlayColor: Color(0x5252052B),
                        activeTrackColor: kActiveColor,
                        inactiveTrackColor: kDefaultSwitchColor,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 180,
                        max: 220,
                        onChanged: (updatedValue) {
                          setState(() {
                            height = updatedValue.toInt();
                          });
                        },
                      ),
                    )
                    */

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Slider(
                            value: height.toDouble(),
                            min: 180,
                            max: 220,
                            onChanged: (updatedValue) {
                              setState(() {
                                height = updatedValue.toInt();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BaseCardDesign(
                        color: kDefaultColor,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kTextStyle,
                            ),
                            Expanded(
                              child: Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            weight--;
                                          }
                                          );
                                        },
                                      )
                                  ),
                                  Expanded(
                                    child: RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: BaseCardDesign(
                        color: kDefaultColor,
                        childWidget: Column(
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kTextStyle,
                            ),
                            Expanded(
                              child: Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                      )
                                  ),
                                  Expanded(
                                      child: RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                      )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded (
                      child: BaseCardDesign (
                        color: kDefaultColor,
                        childWidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container (
                                child: Text (
                                  "Activity",
                                  style: kTextStyle,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Center(
                                child: GestureDetector (
                                  onTap: () async {
                                    int result = await showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      child: ActivityChooserDialog(currentExercise),
                                    );

                                    setState(() {
                                      if (result == null)
                                        result = 1;
                                      currentExercise = result;
                                    });

                                    print(result);
                                  },
                                  child: Text (
                                    activityMap[currentExercise],
                                    style: TextStyle (
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    if (genderSelected != null) {
                      var exeType = 0.0;

                      switch (currentExercise) {
                        case 1: exeType = 1.0;
                            break;
                        case 2: exeType = 1.2;
                        break;
                        case 3: exeType = 1.465;
                        break;
                        case 4: exeType = 1.5498;
                        break;
                      }

                      cal.setData(age, height, weight, exeType, genderSelected);

                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(),
                          )
                      );
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please select a gender',
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
                        'CALCULATE YOUR BMI',
                        style: kCalculateText,
                      ),
                    ),
                    width: double.infinity,
                    color: kBottomContainerColor,
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
