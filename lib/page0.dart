import 'package:flutter/material.dart';
import 'constant.dart';
import 'route_animation.dart';
import 'ainong_indictor.dart';
import 'common/TtsHelper.dart';
class Page0 extends StatefulWidget {
  @override
  State<Page0> createState() {
    return _Page0State();
  }
}

class _Page0State extends State<Page0> with TickerProviderStateMixin {
  List<Tab> tabs = [];
  List<int> ids = [];

  TabController _tabController;
  TabController _tempController;

  @override
  void initState() {
    _tempController = new TabController(vsync: this, length: 0);
    super.initState();
    tabs = Constant.tabs_name.map((it) {
      return Tab(
        text: it,
      );
    }).toList();

    /*res.data.forEach((it) {
      tabs.add(Tab(
        text: it['name'],
      ));
      ids.add(it['id']);
    });*/

    _tabController = new TabController(vsync: this, length: tabs.length);
    setState(() {});
    _tabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            buildTopBar(),
            Expanded(
                child: TabBarView(
              controller: tabs.length > 5 ? _tabController : _tempController,
              children: buildTabPage(),
            ))
          ],
        ));
  }

  Widget buildTopBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 36.0,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
             /* Navigator.push(
                  context,
                  AnimationPageRoute(
                    slideTween:
                        Tween(begin: Offset(0.0, 0.0), end: Offset.zero),
                    builder: (c) {
                      return Test1();
                    },
                  ));*/
            },
            child: Icon(
              Icons.menu,
              size: 23.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TabBar(
              tabs: tabs.length > 5 ? tabs : [],
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              indicator: AiIndictor(),
              controller: tabs.length > 5 ? _tabController : _tempController,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
             /* Navigator.push(
                  context,
                  AnimationPageRoute(
                    slideTween:
                        Tween(begin: Offset(0.0, -1.0), end: Offset.zero),
                    builder: (c) {
                      return Search();
                      // return Test1();
                    },
                  ));*/
            },
          ),
        ],
      ),
    );
  }

  List<Widget> buildTabPage() {
    List<Widget> list = [];

    list.insert(0, Center(child:GestureDetector(
        onTap: () {
          TtsHelper.instance.setLanguageAndSpeak("发现", "zh");
        },child: Text('推荐'))));
    list.insert(1, Center(child:Text('一年级')));
    list.insert(2, Center(child:Text('二年级')));
    list.insert(3, Center(child:Text('三年级')));
    list.insert(4, Center(child:Text('四年级')));
    list.insert(5, Center(child:Text('五年级')));


   /* ids.forEach((it) {
      list.add(ComontTabPage(
        id: it.toString(),
      ));
    });*/

    return list;
  }
}
