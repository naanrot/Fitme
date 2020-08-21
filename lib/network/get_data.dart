import 'dart:convert';

import 'package:http/http.dart' as http;

class GetData {
  Future getData(String url) async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    }catch (e) {
      print(e);
    }
  }
}