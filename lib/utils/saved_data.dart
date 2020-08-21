import 'package:demo_homepage/network/SetNewUser.dart';

class SavedData {
  static final SavedData _instance = SavedData._internal();
  final SetUserData _setUserData = SetUserData();

  factory SavedData() => _instance;

  Future saveData(String id) async {
    final jsonData = await _setUserData.getData(id);
    if (jsonData != null) {
      if(jsonData['conn'] == "connected") {
        if (jsonData['statusCode'] == "1") {
          return true;
        } else {
          print("error msg" + jsonData['errMsg']);
        }
      } else {
        print("error msg" + jsonData['errMsg']);
      }
    }
    return false;
  }

  SavedData._internal();
}