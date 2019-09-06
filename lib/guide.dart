import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/AppTheme.dart';
import 'package:ainong/Splash.dart';
import 'package:ainong/MyHomePage.dart';
import 'package:fluro/fluro.dart';
import 'Router.dart';
import 'application.dart';
import 'constant.dart';
import 'common/ArouterHelper.dart';
class GuidePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GuideState();
  }


}

class GuideState extends State<GuidePage>{


  void startWidget(){
    //Navigator.of(context).pushReplacementNamed(RouterConfig.HOME);
    ARouterHelper.pushReplacement(context,RouterConfig.HOME, {'test':'guide'});
  }

  var pages;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MyHomePage(<Widget>[
      Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(Constant.dir_image+'spash.png'),
        ),
      ),
      Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(Constant.dir_image+'sp2.png'),
        ),
      ),
      new GestureDetector(onTap: startWidget,child:
      Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(Constant.dir_image+'sp3.png'),
        ),
      )),
    ]);
  }

}