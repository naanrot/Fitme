import 'dart:convert';

import 'package:http/http.dart' as http;

class SetBMI {
  Future setData(String url) async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Error in set_bmi");
      }
    } catch (e) {
      print("Error "+ e);
    }
  }
}