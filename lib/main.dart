import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_homepage/scaffold_nav_bar.dart';
import 'package:demo_homepage/screens/home_page/json_data_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'DSMP demo app',
      home: MainLayoutBuilder(),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            //Building custom scroll view with SliverAppBar widget
            Expanded(
              child: BuildCustomScrollView()
            ),
            //Building bottom layout of column
            BuildBottomLayout(),
          ],
        ),
        //bottomNavigationBar: BuildBottomNavBar(),
      )
    );
  }
}

class BuildBottomLayout extends StatefulWidget {
  @override
  _BuildBottomLayoutState createState() => _BuildBottomLayoutState();
}

class _BuildBottomLayoutState extends State<BuildBottomLayout> {

  //Instance of JSONDataFilter to connect to json service
  final JSONDataFilter jsonDataFilter = JSONDataFilter();
  String imageURL;

  //used to know still fetching data from JSONDataFilter
  bool isLoading = true;

  //Default loading animation
  var spinKit = SpinKitCircle(
    color: Colors.green,
  );

  @override
  void initState() {
    super.initState();
    getImageURL();
  }

  getImageURL() async {
    //Waiting to connect JSONDataFilter and waiting to get back
    await jsonDataFilter.jsonDataFetcher();

    //Getting image url from JSONDataFilter
    imageURL = jsonDataFilter.imageURL;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading?spinKit:buildImage(),
    );
  }

  //Building image once loading is done
  Widget buildImage(){
    //Still to be worked done
    //check imageURL has image url else if false show error image to user
    return imageURL == 'false'?Image.asset(''):Image.network(imageURL);
  }
}


class BuildBottomNavBar extends StatefulWidget {
  @override
  _BuildBottomNavBarState createState() => _BuildBottomNavBarState();
}

class _BuildBottomNavBarState extends State<BuildBottomNavBar> {
  int index = 1;
  final JSONDataFilter jsonDataFilter = JSONDataFilter();

  @override
  void initState() {
    super.initState();
    callJSONDataFilter();
  }

  callJSONDataFilter() async {
    await jsonDataFilter.jsonDataFetcher();
    String title = jsonDataFilter.title;
    String imageURL = jsonDataFilter.imageURL;
    print(title);
    print(imageURL);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*0.08;

    return CurvedNavigationBar(
      height: height,
      index: index,
      items: <Widget>[
        Icon(Icons.add, size: 30),
        Icon(Icons.home, size: 30),
        Icon(Icons.compare_arrows, size: 30),
      ],
      onTap:(int){

      },
    );
  }
}

//Building custom scroll view
class BuildCustomScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('AppBar', textScaleFactor: 1.4,),
            expandedHeight: 100,
            floating: true,
            snap: true,
            centerTitle: true,
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Text(
                  'BMI',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}*/
