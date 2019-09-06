import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage(pageList,{Key key, this.title}) : super(key: key){
    this.pageList=pageList;
  }
  List<Widget> pageList;
  var start;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

   String title='1';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  PageController _pageController = PageController();
  GlobalKey<_MyHomePageState> _pageIndicatorKey = GlobalKey();
  int _pageIndex =0;
  Widget _createPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (pageIndex) {
        setState(() {
          _pageIndex = pageIndex;
          print(_pageController.page);
          //print(pageIndex);
        });
      },
      children: widget.pageList
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          color: Colors.white,
//        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(
            children: <Widget>[
              _createPageView(),
              _createPageIndicator()
            ],
          ),
        ));
  }

  _createPageIndicator() {
    return Opacity(
      opacity: 0.3,
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 40),
          height: 40,
          width: 80,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: Colors.grey, //.withAlpha(128),
              borderRadius: BorderRadius.all(const Radius.circular(6.0))),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapUp: (detail) => _handlePageIndicatorTap(detail),
            child: Row(
                key: _pageIndicatorKey,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _dotWidget(0),
                  _dotWidget(1),
                  _dotWidget(2),
                ]),
          ),
        ),
      ),
    );
  }

  _dotWidget(int index) {
    return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (_pageIndex == index) ? Colors.white70 : Colors.black12));
  }
  _handlePageIndicatorTap(TapUpDetails detail) {
    RenderBox renderBox =
    _pageIndicatorKey.currentContext.findRenderObject();
    Size widgeSize = renderBox.paintBounds.size;
    Offset tapOffset =
    renderBox.globalToLocal(detail.globalPosition);

    if (tapOffset.dx > widgeSize.width / 3) {
      _scrollToNextPage();
    } else {
      _scrollToPreviousPage();
    }
  }
  _scrollToNextPage(){
    if (_pageIndex > 0) {
      _pageController.animateToPage(_pageIndex +1,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
  }

  _scrollToPreviousPage() {
    if (_pageIndex > 0) {
      _pageController.animateToPage(_pageIndex - 1,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
  }



}
