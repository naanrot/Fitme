import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_homepage/screens/exercise_page/exercise_page_main.dart';
import 'package:demo_homepage/screens/home_page/home_page_main.dart';
import 'package:demo_homepage/screens/user_profile/user_profile_main.dart';
import 'package:flutter/material.dart';
import 'screens/home_page/build_bottom_view.dart';
import 'screens/home_page/build_sliver_app_bar.dart';

class MainLayoutBuilder extends StatefulWidget {

  @override
  _MainLayoutBuilderState createState() => _MainLayoutBuilderState();
}

class _MainLayoutBuilderState extends State<MainLayoutBuilder> {
  int selectedPage = 1;

  final _pageOption = [
    ExercisePage(),
    HomePage(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[selectedPage],
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 400),
        index: selectedPage,
        height: 50,
        onTap: (index){
          setState(() {
            selectedPage = index;
          });
        },
        items: <Widget>[
          Icon(Icons.list),
          Icon(Icons.home),
          Icon(Icons.person),
        ],
      ),
    );
  }
}

/*SliverToBoxAdapter(
          child: Container(
            color: Colors.green,
            child: BuildBottomView(),
          ),
        )*/

/*SliverToBoxAdapter(
child: Container(
margin: EdgeInsets.only(top: 10),
decoration: BoxDecoration(
borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
color: Colors.orangeAccent,
),
child: ListView.builder(
itemCount: 20,
shrinkWrap: true,
itemBuilder: (context,index){
return Padding(
padding: const EdgeInsets.all(8.0),
child: Container(
color: Colors.orangeAccent,
child: Text(
index.toString()
),
),
);
}
),
),
),*/
