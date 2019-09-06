import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'home.dart';
import '404.dart';
import 'guide.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:ainong/video.dart';
// app的首页
/*var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new HomePage();
  },
);*/

//web view
var webUrlHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return WebviewScaffold(
    url: url,
    withZoom: false,
    withLocalStorage: true,
    withJavascript: true,
    appBar: new AppBar(
      title: new Text(title),
    ),
  );
});

var videoHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AIVideoPlayer(params['url']?.first,params['title']?.first);
  },
);

var splashHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new GuidePage();
  },
);
/*var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = params["type"]?.first;

    return new CategoryHome(name);
  },
);*/

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

/*var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String path = params['filePath']?.first;
  return new FullScreenCodeDialog(
    filePath: path,
  );
});*/
/*
var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});*/
