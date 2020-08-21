class Articles {
  final String _title;
  final String _imageURL;
  final String _source;
  final String _articleURL;

  Articles({String title,String imageURL,String source,String articleURL}):
        _title=title,_imageURL=imageURL,_source=source,_articleURL=articleURL;

  /*set _titles(String s) => title = s;
  set _imageURLs(String s) => _imageURL = s;
  set _sources(String s) => _source = s;
  set _articleURLs(String s) => _articleURL = s;*/

  get titles => _title;
  get imageURLs => _imageURL;
  get sources => _source;
  get articleURLs => _articleURL;
}