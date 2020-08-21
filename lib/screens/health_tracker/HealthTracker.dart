import 'package:demo_homepage/constants/UIconst.dart';
import 'package:demo_homepage/utils/CaloriesBloc.dart';
import 'package:demo_homepage/utils/user_data_fetcher.dart';
import 'package:demo_homepage/widgets/UserStatCardDesign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HealthTracker extends StatefulWidget {
  @override
  _HealthTrackerState createState() => _HealthTrackerState();
}

class _HealthTrackerState extends State<HealthTracker> {
  double _caloriesCount = 0;
  int _stepsCounts = 0;
  bool _isLoading = true;
  List<FlSpot> flSpotList = List();
  List<double> hourCount = List();
  List<double> caloriesList = List();
  final UserDataFetch _dataFetch = UserDataFetch();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final loadingBar = SpinKitCircle(
    color: Colors.orangeAccent,
  );

  String _bmi;
  String _dC;
  String _motto;
  String _tC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
    getData();
  }

  getData() async {

    try {
      FirebaseUser user = await _auth.currentUser();
      final data = await _dataFetch.getData(user.uid);
      print("User Data is " + data['bmi'].toString());
      print("Motto: "+ data['motto']);
      print("Daily Cal: "+ data['dC'].toString());
      _bmi = data['bmi'].toString();
      _dC = data['dC'].toString();
      _motto = data['motto'].toString();
      _tC = data['tC'].toString();

    } catch(e) {
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
    setState(() {
      _isLoading = false;
    });
  }

  void read() async {
    final steps = await FitKit.read(
      DataType.STEP_COUNT,
      dateFrom: DateTime.now().subtract(Duration(days: 5)),
      dateTo: DateTime.now(),
    );

    final calories = await FitKit.read(
      DataType.ENERGY,
      dateFrom: DateTime.now().subtract(Duration(days: 5)),
      dateTo: DateTime.now(),
    );

    int currentHour = 0;
    int temp = 0;
    int threshold = 20;
    int counter = 1;
    for (FitData data in steps) {
      if (data.dateFrom.day == DateTime.now().day) {
        _stepsCounts += data.value;
        temp = data.dateFrom.hour;
        if (currentHour != temp) {
          currentHour = temp;
          print(currentHour);
          if (_stepsCounts > threshold * counter) {
            counter++;
            print(_stepsCounts);
            flSpotList.add(FlSpot(currentHour.toDouble(), _stepsCounts.toDouble()));
          }
        }
      }
    }

    for (FitData data in calories) {
      if (data.dateFrom.day == DateTime.now().day) {
        _caloriesCount += data.value;
      }
    }

    print("Steps " + _stepsCounts.toString());
    print("\n\Calories " + _caloriesCount.toString());
  }

  @override
  Widget build(BuildContext context) {
    final CaloriesBloc bloc = Provider.of<CaloriesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Health Track"),
      ),
      body: _isLoading
          ? loadingBar
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserStatDesign(
                        d1: _caloriesCount.toStringAsFixed(2),
                        d2: _stepsCounts.toString(),
                        t1: "Your today's info",
                        t2: "Today Calories Burnt: ",
                        t3: "Total Step's: ",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserStatDesign (
                        t1: "Your personal stat",
                        t2: "BMI: ",
                        t3: "Motto: ",
                        d1: _bmi,
                        d2: _motto,
                      ),
                    ),
                    SizedBox (
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserStatDesign (
                        t1: "Daily Goal",
                        t2: "Target Calories: ",
                        t3: "Calories Consumed: ",
                        d1: _dC,
                        d2: _tC,
                      ),
                    ),
                    SizedBox (
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            /*LineChartSample2()*/
                        LineChart(
                            LineChartData(
                              backgroundColor: Colors.blueAccent,
                            titlesData: FlTitlesData (
                              leftTitles: SideTitles (
                                margin: 4,
                                reservedSize: 1,
                              )
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                dotData: FlDotData (
                                  show: true,
                                ),
                                  spots:
                                      flSpotList == null || flSpotList.isEmpty
                                          ? [FlSpot(0, 0)]
                                          : flSpotList)
                            ]))
                        ,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}