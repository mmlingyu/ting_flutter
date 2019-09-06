import 'package:flutter/material.dart';
import 'ainong_indictor.dart';
import 'works.dart';
class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() {
    return _Page1State();
  }
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[Works(), Works()],
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            title: Text('subscription',
                style: TextStyle(color: Colors.black, fontFamily: 'Lobster',fontSize: 22)),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 34.0),
              child: Container(
                height: 34.0,
                child: new TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicator: AiIndictor(),
                  tabs: <Tab>[
                    new Tab(
                      text: "作品",
                    ),
                    new Tab(
                      text: "动态",
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          )
        ];
      },
    );
  }
}
