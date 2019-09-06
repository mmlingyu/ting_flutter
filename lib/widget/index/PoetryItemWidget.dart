
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/vo/PeotryVo.dart';
import 'package:ainong/config/ColorsConfig.dart';
/**
 * list view item
 */
class PoetryItemWidget extends StatefulWidget{


  PeotryVo _peotryVo;

  PoetryItemWidget({PeotryVo vo}){
    this._peotryVo = vo;
  }

  @override
  State<StatefulWidget> createState() {

    return new _PoetryItemWidgetState();
  }

}

class _PoetryItemWidgetState extends State<PoetryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Image(
          image:new AssetImage(widget._peotryVo.image),
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover
      ),new Container(child:new Column(children: <Widget>[
        new Padding(padding: EdgeInsets.fromLTRB(2, 6, 2, 2),child:
        new Text(widget._peotryVo.title,style: TextStyle(fontSize: 18,color: ColorsConfig.PRIMARY_GRAY_999),textAlign: TextAlign.left,maxLines: 1)),
    new Padding(padding: EdgeInsets.fromLTRB(0, 6, 2, 6),child:
        new Text(widget._peotryVo.author,style: TextStyle(fontSize: 16,color: ColorsConfig.PRIMARY_GRAY_999),textAlign: TextAlign.left,maxLines: 1)),
    new Padding(padding: EdgeInsets.fromLTRB(2, 6, 2, 0),child:
        new Text(widget._peotryVo.intro,style: TextStyle(fontSize: 14,color: ColorsConfig.PRIMARY_GRAY_999),textAlign: TextAlign.left,maxLines: 1)),
      ],crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,),padding:EdgeInsets.fromLTRB(8,2,2,2)) ,

    ],verticalDirection: VerticalDirection.down);
  }
}

