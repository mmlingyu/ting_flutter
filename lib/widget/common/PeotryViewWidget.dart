import 'package:flutter/material.dart';

class PeotryViewWidget extends StatelessWidget {

  String content;

  PeotryViewWidget({this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 100,child:Scrollbar(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        padding: EdgeInsets.all(1.0),
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: content.split("。")
            //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(c, textScaleFactor: 1.2,textAlign: TextAlign.left,))
                .toList(),
          ),
        ),
      ),
    ));
  }
}