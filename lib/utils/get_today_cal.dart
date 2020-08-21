import 'package:demo_homepage/network/update_today_cal.dart';

class GetTodayCal {
  String url = "https://ajmal-eache.000webhostapp.com/fitme/updateTodayCal.php?";
  final _updateTodayCal = UpdateTodayCal();

  Future getData(String id, String cal) async {
    String q = "id="+ id +"&cal="+ cal;
    final jsonBody = await _updateTodayCal.setData(url+q);
    if (jsonBody["conn"] == "connected") {
      if (jsonBody["statusCode"] == "1") {
        return true;
      }
    }
    return false;
  }
}