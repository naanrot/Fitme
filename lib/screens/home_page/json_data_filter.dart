import 'dart:collection';

import '../../utils/news_fethcer.dart';

class JSONDataFilter {
  //Passing url to news_fethcer to connect to url and get json body
  final GetJSONNews getJSONNews = GetJSONNews(
      url:
          'https://newsapi.org/v2/top-headlines?category=health&country=in&apikey=3344c1e91c6c49bfa5dc51002ffb006d');

  //Articles title
  List<String> _title = List<String>();

  int numberOfArticles;
  //Articles image url
  List<String> _imageURL = List<String>();
  List<String> _sources = List<String>();

  jsonDataFetcher() async {
    try {
      final jsonBody = await getJSONNews.getData();
      if (jsonBody != null) {
        int numberOfArticles = jsonBody['articles'].length;
        for(var i = 0;i<numberOfArticles;i++){
          _title.add(jsonBody['articles'][i]['title']);
          _imageURL.add(jsonBody['articles'][i]['urlToImage']);
          _sources.add(jsonBody['articles'][i]['source']['name']);
        }

        print(jsonBody.length);
        print(jsonBody['articles'].length);
        print(jsonBody['articles'][0]['name']);
      }
    } catch (e) {
      print('Error in json_data_filter'+e);
    }
  }

  get title => _title;

  get imageURL => _imageURL;

  get sources => _sources;
}
