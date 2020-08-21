import 'package:demo_homepage/network/set_bmi.dart';
import 'package:http/http.dart' as http;

class UserSaveData {
  final SetBMI _setBMI = SetBMI();
  final String _url = "https://ajmal-eache.000webhostapp.com/fitme/setdata.php";

  Future saveData(String id, double bmi, double dailyCal, String motto) async {
    String query = "?id="+ id +"&bmi="+ bmi.toString() +"&dC="+ dailyCal.toString() +"&mot="+motto;
    print("Query: "+ _url+query);
    final jsonData = await _setBMI.setData(_url+query);

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
}