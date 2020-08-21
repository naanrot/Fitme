import 'package:demo_homepage/network/get_data.dart';

class UserDataFetch {
  final String _url = "https://ajmal-eache.000webhostapp.com/fitme/getUserData.php?id=";
  final GetData _getData = GetData();

  Future getData(String id) async {
    final jsonData = await _getData.getData(_url+id);
    if (jsonData != null) {
      if(jsonData['conn'] == "connected") {
        return jsonData['data'];
      } else {
        print("error msg" + jsonData['errMsg']);
      }
    }
    return "null";
  }
}