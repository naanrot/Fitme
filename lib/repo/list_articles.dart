import 'package:demo_homepage/modal/articles.dart';
import 'package:demo_homepage/utils/json_data_filter.dart';

class News {
  static final News instance = News._internal();
  factory News(){
    return instance;
  }
  News._internal();

  List<Articles> _articles = List<Articles>();
  final JSONDataFilter jsonDataFilter = JSONDataFilter();

  Future startFetcher() async {
    await jsonDataFilter.jsonDataFetcher();
  }

  get article => _articles;
}