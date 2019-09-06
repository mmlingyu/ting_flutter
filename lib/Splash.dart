import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ainong/AppTheme.dart';
import 'MyHomePage.dart';
import 'Router.dart';
import 'application.dart';


class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(title:'',
        theme: ThemeData(primaryColor: AppTheme.appThemeColors,backgroundColor: AppTheme.appThemeColors),
        home: new SplashPage(),
      onGenerateRoute: Application.router.generator,


    );
  }

}

class SplashPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return new _SplashPageState();
  }

}

class _SplashPageState extends State<SplashPage>{
  @override
  Widget build(BuildContext context) {

    return new GestureDetector(onTap:start ,child: new Image.asset('assets/images/spash.png'));
  }

  @override
  void initState() {
    super.initState();
    timerdown();
  }

  void timerdown(){
    new Future.delayed(new Duration(seconds: 3),start);
  }


  void start(){
    Navigator.of(context).pushReplacementNamed(RouterConfig.splash);
    /*Navigator.pushAndRemoveUntil(context, new PageRouteBuilder(pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation) {
      // 跳转的路由对象
      return new MyHomePage();
    },transitionDuration:
    const Duration(milliseconds: 900), transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      return createFadeTransition(animation, child);
    }),ModalRoute.withName('/'));*/
    /*Navigator.push<String>(
        context,
        new PageRouteBuilder(pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation) {
          // 跳转的路由对象
          return new MyHomePage();
        },transitionDuration:
        const Duration(milliseconds: 100), transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
            ) {
          return createFadeTransition(animation, child);
        }));*/

  }

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }


  static FadeTransition createFadeTransition(
      Animation<double> animation, Widget child) {
    return new FadeTransition(
      opacity: new Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: child,
    );
  }
}