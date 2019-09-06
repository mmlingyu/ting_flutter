import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class BannerWidget extends StatelessWidget{

  List<DecorationImage> images;

  BannerWidget(){
    this.images = getBanner();
  }

  List<DecorationImage> getBanner(){
    List<DecorationImage> banners = new List<DecorationImage>();
    banners.add(new DecorationImage(
        image:NetworkImage("https://img.zcool.cn/community/01cdae573999ff6ac72580ed4e886f.jpg@1280w_1l_2o_100sh.jpg"),
        fit: BoxFit.cover
    ));

    banners.add(new DecorationImage(
        image:NetworkImage("https://img.pconline.com.cn/images/upload/upc/tx/piebbs/1508/06/c0/10749174_1438823314664_1024x1024it.jpg"),
        fit: BoxFit.fill
    ));

    banners.add(new DecorationImage(
        image:NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565152414498&di=05bd1cf3dfb5cf1b14880b4ac55c793e&imgtype=0&src=http%3A%2F%2Fpic186.nipic.com%2Ffile%2F20181020%2F22950071_082357054000_2.jpg"),
        fit: BoxFit.fill
    ));
    return banners;
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(height:160,
        child:new Container(
              margin: new EdgeInsets.fromLTRB(0, 10, 0, 10),
              child:new Swiper(
              itemBuilder: (BuildContext context, int index) {
                  return new Container(
                      decoration: BoxDecoration( shape: BoxShape.rectangle,
                      borderRadius:BorderRadius.circular(20),
                      image:images.elementAt(index)
                  ),
                );
              },
              pagination: new SwiperPagination(),
              itemCount: images.length,
              onTap: (index) {print('点击了第${index}');},
              viewportFraction: 0.8,
              scale: 0.8,
             )
        ));
  }

}