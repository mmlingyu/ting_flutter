import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/AppTheme.dart';
import 'package:ainong/Splash.dart';
import 'package:ainong/MyHomePage.dart';
import 'package:fluro/fluro.dart';
import 'Router.dart';
import 'application.dart';
import 'constant.dart';
import 'guide.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  MyApp(){
    final router = new Router();
    RouterConfig.configureRoutes(router);
    Application.router = router;
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
      home: new GuidePage()
      //onGenerateRoute: Application.router.generator,
    );
  }
}



