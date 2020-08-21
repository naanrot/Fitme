import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {

  ArticleWebView({@required this.url});

  final url;

  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> completer = Completer<WebViewController>();

    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController con){
        completer.complete(con);
      },
    );
  }
}
