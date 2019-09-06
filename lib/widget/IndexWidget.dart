import 'package:ainong/core/ModelFactory.dart';
import 'package:ainong/viewmodel/IndexModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/common/BannerWidget.dart';
import 'package:ainong/widget/HScrollWidget.dart';
import 'package:ainong/widget/RecommendListWidget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final IndexModel _indexModel = IndexModel();

class IndexWidget extends StatefulWidget {
  IndexWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IndexWidgetState createState() => new _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {

  _onRefresh(){
    print("_onRefresh --- >");
  }

  //IndexModel _indexModel = ModelFactory.instance.of("IndexModel") as IndexModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller:_indexModel.scrollController,
        child: Container(
        alignment:Alignment.topCenter,
        child: Stack( alignment: const FractionalOffset(0.7, 0.98),children:<Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:[
               new Flexible(child:new BannerWidget()),
                new Text('------------最美声音----------', style: new TextStyle(
                    color: Colors.black54,
                    fontSize: 18)),
                new Container(child:new Align(
                  alignment: Alignment.topLeft,
                  child: new Text("最美推荐",style: new TextStyle(
                      fontSize: 16)),
                ) ,margin: EdgeInsets.fromLTRB(12, 2, 12, 2)),
                new HScrollWidget(),//横向操作栏
                new RecommendListWidget(),
            ]
          ),Observer(builder: (_) =>  new Offstage(
              offstage: !_indexModel.getShow(),child:new Row(mainAxisAlignment: MainAxisAlignment.end,children:<Widget>[new Icon(Icons.filter_vintage,size:60,color: const Color.fromRGBO(255, 0, 0, 0.7))]))),
        ]
    )));
  }
}
