
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/constant.dart';
class NavgationBottom extends StatefulWidget{

  var titles; //= ['首页', '关注', '通知', '我的'];
  List<StatefulWidget> _pageList;
  var icons,icons_selcect;

  NavgationBottom(icons,icons_selcect,titles,_pageList){
    this.icons =icons;
    this.icons_selcect = icons_selcect;
    this.titles = titles;
    this._pageList=_pageList;
  }



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NavgationBottomState();
  }

}

class _NavgationBottomState extends State<NavgationBottom> with TickerProviderStateMixin{

  int _currentIndex = 0;    // 当前界面的索引值
  //List<StatefulWidget> _pageList;   // 用来存放我们的图标对应的页面
  StatefulWidget _currentPage;  // 当前的显示页面



  List<Widget> unselected;

  List<Widget> selected;


  Image getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return selected[curIndex];
    }
    return unselected[curIndex];
  }
  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return new Text(widget.titles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(widget.titles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }


  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState((){});
  }

  void init(){
    selected=<Widget>[Image.asset(Constant.dir_image+widget.icons_selcect[0],width: 24,height: 24),Image.asset(Constant.dir_image+widget.icons_selcect[1],width: 24,height: 24),
    Image.asset(Constant.dir_image+widget.icons_selcect[2],width: 24,height: 24),Image.asset(Constant.dir_image+widget.icons_selcect[3],width: 24,height: 24)];
    unselected=<Widget>[Image.asset(Constant.dir_image+widget.icons[0],width: 24,height: 24),Image.asset(Constant.dir_image+widget.icons[1],width: 24,height: 24),
    Image.asset(Constant.dir_image+widget.icons[2],width: 24,height: 24),Image.asset(Constant.dir_image+widget.icons[3],width: 24,height: 24)];
  }

  @override
  void initState() {
    super.initState();
    init();


    _currentPage = widget._pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
// 声明定义一个 底部导航的工具栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: getTabIcon(0), title: getTabTitle(0)),
        new BottomNavigationBarItem(
            icon: getTabIcon(1), title: getTabTitle(1)),
        new BottomNavigationBarItem(
            icon: getTabIcon(2), title: getTabTitle(2)),
        new BottomNavigationBarItem(
            icon: getTabIcon(3), title: getTabTitle(3))
      ]
      ,  // 添加 icon 按钮`
      currentIndex: _currentIndex,  // 当前点击的索引值
      type: BottomNavigationBarType.fixed,    // 设置底部导航工具栏的类型：fixed 固定
      onTap: (int index){   // 添加点击事件
        setState((){    // 点击之后，需要触发的逻辑事件
          //_navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _currentPage = widget._pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: SafeArea(top:true,child:new Center(
            child: _currentPage   // 动态的展示我们当前的页面
        )),
        bottomNavigationBar: bottomNavigationBar,   // 底部工具栏
      ),

      theme: new ThemeData(
        primarySwatch: Colors.blue,   // 设置主题颜色
      ),

    );

  }


}