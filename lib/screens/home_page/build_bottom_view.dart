
import 'package:demo_homepage/utils/json_data_filter.dart';
import 'package:demo_homepage/repo/list_articles.dart';
import 'package:demo_homepage/screens/home_page/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuildSliverList extends StatefulWidget {
  @override
  _BuildSliverListState createState() => _BuildSliverListState();
}

class _BuildSliverListState extends State<BuildSliverList> {
  final JSONDataFilter jsonDataFilter = JSONDataFilter();
  final News news = News();
  bool isLoading = true;
  /*List<String> titles = List<String>();
  List<String> imageURLs = List<String>();
  List<String> sources = List<String>();
  List<String> articleURL = List<String>();*/

  final loadingBar = SliverToBoxAdapter(
    child: Center(
      child: Container(
        child: SpinKitWave(
          color: Colors.orangeAccent,
        ),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    getJSONData();
  }

  getJSONData() async {
    if (news.article.length == 0) {
      try {
        await jsonDataFilter.jsonDataFetcher();
        await news.startFetcher();
        //Testing code here
        try {
          print(news.article[5].titles);
        }catch(e){
          print(e);
        }
        //ends here
        /*titles = jsonDataFilter.title;
        imageURLs = jsonDataFilter.imageURL;
        sources = jsonDataFilter.sources;
        articleURL = jsonDataFilter.articleURL;
        print(titles.length);*/
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print('In line 30 in build_bottom_view');
        print(e);
      }
    } else{
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingBar
        : SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    print(index);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleWebView(url: news.article[index].articleURLs)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.grey)
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                            child: Image.network(news.article[index].imageURLs),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    news.article[index].titles,
                                    style: TextStyle(
                                      fontFamily: 'PlayfairDisplay',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    news.article[index].sources,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
              childCount: news.article.length,
            ),
          );
  }
}
