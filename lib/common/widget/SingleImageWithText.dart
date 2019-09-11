
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/config/LayoutDirection.dart';

/**
 * 图片和文字混排
 *
 * 支持文字居图片顶部
 * 支持文字居图片底部
 * 支持自定义图片路径和文本
 * LayoutDirection layoutDirection
 *
 */
class SingleImageWithText extends StatelessWidget{


  String _assetImage;
  String _text;
  LayoutDirection _layoutDirection;
  SingleImageWithText({LayoutDirection layoutDirection,String assetImage,String text}){
    this._layoutDirection = layoutDirection;
    this._assetImage = assetImage;
    this._text = text;
  }

  @override
  Widget build(BuildContext context) {

    return _buildWidget(_assetImage,_text);
  }

  Widget _buildWidget(String assetPath,String text){
    Widget _widget;
    switch(_layoutDirection){
      case LayoutDirection.top:_widget= _topBuild(assetPath, text);break;
      case LayoutDirection.bottom:_widget= _bottomBuild(assetPath, text);break;
      case LayoutDirection.left:_widget= _leftBuild(assetPath, text);break;
      case LayoutDirection.right:_widget= _rightBuild(assetPath, text);break;
    }
    return _widget;
    //return _layoutDirection == LayoutDirection.top?_topBuild(assetPath, text):_bottomBuild(assetPath, text);

  }

  _leftBuild(String assetPath,String text) {
    return new Row(children: <Widget>[
      new Text(text),
      new Image(
          image:assetPath?.isNotEmpty? null:new AssetImage(assetPath),
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover
      )
    ], mainAxisAlignment: MainAxisAlignment.spaceAround);
  }
  _rightBuild(String assetPath,String text) {
    return new Row(children: <Widget>[
      new Image(
          image:assetPath?.isNotEmpty? null:new AssetImage(assetPath),
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover
      ),
      new Text(text),
    ], mainAxisAlignment: MainAxisAlignment.spaceAround);
  }

  _topBuild(String assetPath,String text) {
    return new Column(children: <Widget>[
      new Text(text),
      new Image(
          image:assetPath?.isNotEmpty? null:new AssetImage(assetPath),
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover
      )
    ], mainAxisAlignment: MainAxisAlignment.spaceAround);
  }

  _bottomBuild(String assetPath,String text) {
    return new Column(children: <Widget>[

      new Image(
          image: new AssetImage(assetPath),
          width: 100.0,
          height: 100.0,
          fit: BoxFit.cover
      ),
      new Text(text),
    ], mainAxisAlignment: MainAxisAlignment.spaceAround);
  }
}