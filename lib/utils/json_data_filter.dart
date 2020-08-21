import 'dart:collection';
import '../network/news_fethcer.dart';
import '../modal/articles.dart';
import '../repo/list_articles.dart';

class JSONDataFilter {
  //Passing url to news_fethcer to connect to url and get json body
  final GetJSONNews getJSONNews = GetJSONNews(
      url:
          'https://newsapi.org/v2/top-headlines?category=health&country=in&apikey=3344c1e91c6c49bfa5dc51002ffb006d');

  final String _imageNotFoundURL = 'https://forum.photo.gallery/ext/imagevue/textimage/?the%20image%20could%20not%20be%20loaded';

  //Articles title
  List<String> _title = List<String>();

  int numberOfArticles;
  //Articles image url
  List<String> _imageURL = List<String>();
  //Articles article source url
  List<String> _sources = List<String>();
  //Articles article source url
  List<String> _articleURL = List<String>();

  jsonDataFetcher() async {
    try {
      final jsonBody = await getJSONNews.getData();
      if (jsonBody != null) {
        int numberOfArticles = jsonBody['articles'].length;
        for(var i = 0;i<numberOfArticles;i++){

          //Code for testing purpose
          News.instance.article.add(Articles(
            title:jsonBody['articles'][i]['title'],
            imageURL: jsonBody['articles'][i]['urlToImage']==null?_imageNotFoundURL:jsonBody['articles'][i]['urlToImage'],
            source: jsonBody['articles'][i]['source']['name'],
            articleURL: jsonBody['articles'][i]['url']
          ));
          //ends here

          _title.add(jsonBody['articles'][i]['title']);
          if(jsonBody['articles'][i]['urlToImage'] == null) {
            _imageURL.add(_imageNotFoundURL);
          }
          else {
            _imageURL.add(jsonBody['articles'][i]['urlToImage']);
          }
          _sources.add(jsonBody['articles'][i]['source']['name']);
          _articleURL.add(jsonBody['articles'][i]['url']);
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

  get articleURL => _articleURL;
}
