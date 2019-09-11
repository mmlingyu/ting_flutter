import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/AppTheme.dart';
import 'package:ainong/Splash.dart';
import 'package:ainong/MyHomePage.dart';
import 'package:ainong/utils/StoreUtils.dart';
import 'package:fluro/fluro.dart';
import 'Router.dart';
import 'application.dart';
import 'arouterConfig.dart';
import 'constant.dart';
import 'guide.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
void main() => initApp();
void initApp() async {
  bool success = await StoreUtil.getInstance();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  MyApp(){
    final router = new Router();
    RouterConfig.configureRoutes(router);
    Application.router = router;
  }

  bool isFirstEnter() {
    var temp = StoreUtil.preferences.get(Constant.MAIN_FIRST_ENTER);
    return temp==null?false:temp;
  }

  void setFirstEnter() {
    StoreUtil.preferences.setBool(Constant.MAIN_FIRST_ENTER,true);
  }

  Widget buildHomePage () {

        if(!isFirstEnter()){
          setFirstEnter();
          return new GuidePage();
        }else{
          return new HomePage(new MyRouteOption("",null));
        }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:  Colors.red,//title bg color
        backgroundColor: Color(0xFF000000),
          accentColor: Color(0xFF888811),//green
        textTheme:TextTheme(body1: TextStyle(color: Color(0xFF822211),fontSize: 16.0)),//content-text
        iconTheme:IconThemeData(color: AppTheme.appThemeColors,size: 14.0)//+号
      ),
      home: buildHomePage()
      //onGenerateRoute: Application.router.generator,
    );
  }
}



