import 'dart:convert';
import 'package:http/http.dart' as http;

class SetUserData {
  String url = "https://ajmal-eache.000webhostapp.com/fitme/new_user.php?id=";

  Future getData(String id) async {
    try {
      http.Response response = await http.get(url+id);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print("Error in user_data_fethcer status");
      }

    } catch (e) {
      print("Error in user_data_fethcer connection");
    }
  }
}