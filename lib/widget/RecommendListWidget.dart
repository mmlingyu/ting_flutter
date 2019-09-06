
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/vo/PeotryVo.dart';
import 'package:ainong/widget/index/PoetryItemWidget.dart';
import 'package:ainong/common/ArouterHelper.dart';
import 'package:ainong/Router.dart';

class RecommendListWidget extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {

    return new _RecommendListState();
  }
}

class _RecommendListState extends State<RecommendListWidget>{
  List<PeotryVo> data = new List();
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){

    for(var i=0;i<6;i++){
      data.add(new PeotryVo(image:"assets/images/plane.png",title:"静夜思",author:"【唐】李白",intro:"床前明月光，疑是地上霜"));
    }
    /*setState(() {

    });*/

  }

  void onItemClick(int i, String title) {
    ARouterHelper.pushReplacement(context,RouterConfig.PEOTRY_DETAIL, {'title':'$title'});
  }

  @override
  Widget build(BuildContext context) {

    return new ListView.separated(
      shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
              child:new Container(
                    child: new PoetryItemWidget(vo:data.elementAt(index)),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(2),
                    height: 100
                  )
                  ,onTap:()
                  {
                    onItemClick(index, data.elementAt(index).title);
                  }
          );
          },
        separatorBuilder: (BuildContext context, int index) {
          return new Container(height:0.5, color: Colors.grey);
        },
        physics:new NeverScrollableScrollPhysics(),
        itemCount: data.length);
  }

}