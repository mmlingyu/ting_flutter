import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/common/widget/SingleImageWithText.dart';
import 'package:ainong/config/LayoutDirection.dart';
import 'package:ainong/config/ColorsConfig.dart';
import 'package:ainong/vo/FamilyVo.dart';
class HScrollWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _HScrollWidgetState();
  }

}
class _HScrollWidgetState extends State<HScrollWidget>{

  List<FamilyVo> _list = new List();

  @override
  Widget build(BuildContext context) {
    print(" build~ ");
    return _buildContainer(_list);
  }

  @override
  void initState() {
    print(" initState~ ");
    super.initState();
    getData();
  }


  ///请求数据 刷新数据
  void getData(){
    print(" loading data~ ");
    if(_list.length>0)_list.clear();
    _list.add(new FamilyVo(assetsImage:'assets/images/food04.jpeg',title:'大宝宝'));
    _list.add(new FamilyVo(assetsImage:'assets/images/food05.jpeg',title:'小宝宝'));
    _list.add(new FamilyVo(assetsImage:'assets/images/food06.jpeg',title:'好爸爸'));
    _list.add(new FamilyVo(assetsImage:'assets/images/food04.jpeg',title:'好妈妈'));
    _list.add(new FamilyVo(assetsImage:'',title:''));
   /* setState(() {

    });*/
  }

  ///根据数据构建widgets
  List<Widget> _buildWidthData(){
    List<Widget> widgets = new List();
    for(FamilyVo family in _list){

      widgets.add(new Container(
        width: 100.0,
        //color: widgets.length%2==0?ColorsConfig.primaryColor:ColorsConfig.PRIMARY_YELLOW,
        color: ColorsConfig.PRIMARY_WHITE,
        padding: EdgeInsets.all(6),
        child: new SingleImageWithText(layoutDirection:LayoutDirection.bottom,assetImage: family.assetsImage,text: family.title),
      ));
    }
    return widgets;
  }

  ///构建组件wigget
  Widget _buildContainer(List<FamilyVo> data){
   return new Flexible(child:
    new Container(
      width: double.infinity,
      height: 136,
      padding: EdgeInsets.all(2),
      child:
      new ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: _buildWidthData()
      )
      ,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: new Border.all(color: ColorsConfig.primaryColor, width: 0.5),
        //color: Color(0xFFffffff),
        borderRadius: new BorderRadius.all(Radius.circular(5)), // 也可控件一边圆角大小
      ),

    ) );
  }

}