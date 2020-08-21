import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_homepage/constants/UIconst.dart';
import 'package:demo_homepage/utils/get_today_cal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:toast/toast.dart';

class BreakfastScreen extends StatefulWidget {
  @override
  _BreakfastScreenState createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  final GetTodayCal _todayCal = GetTodayCal();
  final _firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = "";

  Widget buildList(DocumentSnapshot doc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          final isSuccessful = await _todayCal.getData(uid, doc['calories'].toString());

          if (isSuccessful) {
            Fluttertoast.showToast(
              msg: 'Your calories have been updated',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16,
              backgroundColor: kDefaultColor,
              textColor: kActiveColor,
            );
          } else {
            Fluttertoast.showToast(
              msg: 'Connection error',
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
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    doc['itemName'],
                  ),
                ),
                Text(
                  doc['calories']+' cal'
                )
              ],
            )
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUid();
  }

  setUid() async {
    FirebaseUser user = await _auth.currentUser();
    uid = user.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What did you eat",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: StreamBuilder(
            stream: _firestore.collection('CookBook').document('Breakfast').collection('items').snapshots(),
            builder:(context, snapshot) {
              if(snapshot == null) return Text("Loading...");
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return buildList(snapshot.data.documents[index]);
                  },
                ),
              );
            }
          )
          ),
      ),
    );
  }
}
