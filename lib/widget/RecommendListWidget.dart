
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
      data.add(new PeotryVo(
          image:"assets/images/app_default.png",
          title:"静夜思",
          author:"【唐】李白",
          intro:"床前明月光，疑是地上霜。举头望明月，低头思故乡",
          gif: 'hua.gif',
          yiwen: '明亮的月光洒在窗户纸上，好像地上泛起了一层霜。我禁不住抬起头来，看那天窗外空中的一轮明月，不由得低头沉思，想起远方的家乡。',
          zhushi: '①静夜思:这是一首自命题的乐府诗。安静的夜晚产生的思绪。\r\n②床:诗中的“床”字，是争论和异议的焦点。今传五种说法。①指井台。②指井栏。③“窗”的通假字。从意义上讲，“床”可能与‘窗’通假，而且在窗户前面是可能看到月亮的。但是，参照宋代版本，‘举头望山月’，便可证实作者所言乃是室外的月亮。④取本义，即坐卧的器具，《诗经·小雅·斯干》有“载寐之牀”，《易·剥牀·王犊注》亦有“在下而安者也”之说，讲得即是卧具。⑤马未都等认为，床应解释为胡床。胡床，亦称“交床”、“交椅”、“绳床”。古时一种可以折叠的轻便坐具。\r\n③疑：好像。\r\n④举:抬头。',
          shangxi: '《静夜思》没有奇特新颖的想象，没有精工华美的辞藻，只是用叙述的语气，写远客思乡之情，然而它却意味深长，耐人寻绎，千百年来，如此广泛地吸引着读者。全诗从“疑”到“举头”，从“举头”到“低头”，形象地揭示了诗人内心活动，鲜明地勾勒出一幅生动形象的月夜思乡图，抒发了作者在寂静的月夜思念家乡的感受。客中深夜不能成眠、短梦初回的情景。这时庭院是寂寥的，透过窗户的皎洁月光射到床前，带来了冷森森的秋宵寒意。诗人朦胧地乍一望去，在迷离恍惚的心情中，真好像是地上铺了一层白皑皑的浓霜；可是再定神一看，四周围的环境告诉他，这不是霜痕而是月色。月色不免吸引着他抬头一看，一轮娟娟素魄正挂在窗前，秋夜的太空是如此明净。秋月是分外光明的，然而它又是清冷的。对孤身远客来说，最容易触动旅思秋怀，使人感到客况萧条，年华易逝。凝望着月亮，也最容易使人产生遐想，想到故乡的一切，想到家里的亲人。想着，想着，头渐渐地低了下去，完全浸入于沉思之中。'));
    }
    /*setState(() {

    });*/

  }

  void onItemClick(int i, PeotryVo peotryVo) {
    ARouterHelper.push(context,RouterConfig.PEOTRY_DETAIL, {'title':peotryVo.title,'content':peotryVo.intro,'gifimage':peotryVo.gif,"author":peotryVo.author,"zhushi":peotryVo.zhushi,"yiwen":peotryVo.yiwen,"shangxi":peotryVo.shangxi});
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
                    onItemClick(index, data.elementAt(index));
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