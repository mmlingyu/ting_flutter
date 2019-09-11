import 'package:ainong/common/widget/SingleImageWithText.dart';
import 'package:ainong/config/LayoutDirection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constant.dart';
//诗词内容widget
class PeotryWidget extends StatelessWidget {

  String title;
  String author;
  String content;
  String assetsGif;

  PeotryWidget(String title,String author,String content){
    this.title = title;
    this.author = author;
    this.content = content;
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(children: <Widget>[new SingleImageWithText(layoutDirection: LayoutDirection.left,
        assetImage:Constant.dir_image+"speak_icon.png",text: title,),Text(this.author),Text(this.content)]),
    );
    /*return Container(
      child: new SingleImageWithText(layoutDirection: LayoutDirection.left,
        assetImage:Constant.dir_image+"speak_icon.png",text: title),
    );*/
  }
}
