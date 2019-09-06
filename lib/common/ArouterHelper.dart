import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/arouterConfig.dart';
import '../arouterConfig.dart';
import 'package:annotation_route/route.dart';
import '../404.dart';
class ARouterHelper {

    static ArouterConfig arouterConfig = new ArouterConfig();

    static push(context,url,callback){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return pageFromUrlAndQuery(url,null);
          }));
    }

    static pushReplacement(context,url,param){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context){
            return arouterConfig.getPage(new MyRouteOption(url, param)).widget;
          }));
    }
    static Widget pageFromUrlAndQuery(String urlString, Map<String, dynamic> query) {
      ARouterResult routeResult = arouterConfig.getPage(new MyRouteOption(urlString, query));
      if(routeResult.state == ARouterResultState.FOUND) {
        return routeResult.widget;
      }
      return new WidgetNotFound();
    }
}