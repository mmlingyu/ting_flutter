import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MyHomePage.dart';
import 'common/navgation.dart';
import 'widget/IndexWidget.dart';
import 'package:annotation_route/route.dart';
import 'page0.dart';
import 'page1.dart';
import 'Toast.dart';
import 'Router.dart';
import 'arouterConfig.dart';

@ARoute(url:RouterConfig.HOME)
class HomePage extends StatefulWidget{

  MyRouteOption option;

  HomePage(MyRouteOption option){
    this.option = option;
  }

  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }

}

class _HomeState extends State<HomePage> with TickerProviderStateMixin{

  var titles = ['首页', '故事', '动态', '我的'];
  List<StatefulWidget> _pageList= <StatefulWidget>[
    IndexWidget(),
    Page0(),
    Page1(),
    Page0(),
  ];
  var icons = [
    'ic_tab_strip_icon_feed.png',
    'ic_tab_strip_icon_follow.png',
    'ic_tab_strip_icon_category.png',
    'ic_tab_strip_icon_profile.png'
  ];
  var icons_selcect = [
    'ic_tab_strip_icon_feed_selected.png',
    'ic_tab_strip_icon_follow_selected.png',
    'ic_tab_strip_icon_category_selected.png',
    'ic_tab_strip_icon_profile_selected.png'
  ];

  @override
  Widget build(BuildContext context) {
    //Toast.toast(context, widget.option.toString());
    //titles[3]=widget.option.params['test'];
    return new NavgationBottom(icons, icons_selcect, titles, _pageList);

  }


}