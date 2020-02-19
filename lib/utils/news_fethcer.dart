import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GetJSONNews {
  GetJSONNews({@required this.url});

  //URL of json service
  final url;

  Future getData() async {

    try {
      //Connecting to url
      http.Response response = await http.get(url);

      //Checking status code to ensure everything is fine
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      }
      else
        print('Error in news_fetcher line 24');
    }catch(e){
      print('Error in news_fethcer line 26');
      print(e);
    }
  }
}