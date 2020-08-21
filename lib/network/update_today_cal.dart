import 'dart:convert';

import 'package:http/http.dart' as http;

class UpdateTodayCal {
  setData(String url) async {
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200 && response.body != null) {
        return jsonDecode(response.body);
      } else {
        print("Body is null of status code not 200");
      }
    } catch (e) {
      print(e);
    }
    print("Cannot load");
  }
}