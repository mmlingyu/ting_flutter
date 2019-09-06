
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '404.dart';
import 'package:ainong/router_handler.dart';
import 'arouterConfig.dart';
import 'package:annotation_route/route.dart';
class RouterConfig{
  static const String HOME='ainong://home';
  static const String PEOTRY_DETAIL='ainong://peotry_detail';
  static const String splash='/splash';
  static const String WEB_URL='/url';
  static const String VIDEO='/video';


  static void configureRoutes(Router router) {

    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        });
    //router.define(HOME, handler: homeHandler);
    router.define(splash, handler: splashHandler);
    router.define(WEB_URL, handler: webUrlHandler);
    router.define(VIDEO, handler: videoHandler);
    router.define('/category/error/404', handler: widgetNotFoundHandler);
   /* widgetDemosList.forEach((demo) {
      Handler handler = new Handler(
          handlerFunc: (BuildContext context, Map<String, List<String>> params) {
            return demo.buildRouter(context);
          });
      router.define('${demo.routerName}', handler: handler);
    });*/
   

  }


}