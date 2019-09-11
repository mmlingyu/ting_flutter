
import 'package:ainong/common/FixTabBarView.dart';
import 'package:ainong/common/widget/SingleImageWithText.dart';
import 'package:ainong/config/ColorsConfig.dart';
import 'package:ainong/config/LayoutDirection.dart';
import 'package:ainong/viewmodel/PeotryModel.dart';
import 'package:ainong/widget/common/BaseViewBar.dart';
import 'package:ainong/widget/common/PeotryViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ainong/Router.dart';
import 'package:annotation_route/route.dart';
import 'package:ainong/arouterConfig.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constant.dart';
import 'common/PeotryWidget.dart';

final PeotryModel _peotryModel = new PeotryModel();

@ARoute(url: RouterConfig.PEOTRY_DETAIL)
class PeotryDetailWidget extends StatefulWidget {

  MyRouteOption option;
  PeotryDetailWidget(MyRouteOption option){
    this.option = option;
  }
  @override
  _PeotryDetailWidgetState createState() => _PeotryDetailWidgetState();
}

class _PeotryDetailWidgetState extends State<PeotryDetailWidget> with SingleTickerProviderStateMixin {

  TabController _tabController;
  PageController _pageController;
  FixTabBarView _fixTabBarView;

  List<Choice> choices = null;
  @override
  void initState() {
    super.initState();
    initParam();
    _pageController = PageController();
    // 添加监听器
    _tabController = TabController(vsync: this, length: choices.length)
      ..addListener(() {
        _select(choices.elementAt(_tabController.index));
        //_defaultPos = _tabController.index;
        _fixTabBarView.pageController.jumpToPage(_tabController.index);
        //_pageController.animateToPage(_tabController.index, duration: Duration(milliseconds:100), curve: new ElasticInCurve(0.2));
      });
  }


  void _select(Choice choice) {
    setState(() { // Causes the app to rebuild with the new _selectedChoice.
    });
  }

  List<Widget> _headerSliverBuilder(BuildContext context, bool innerBoxIsScrolled){
    return <Widget>[
      SliverAppBar(
        //1.在标题左侧显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
        leading: new IconButton(
          icon: Icon(Icons.arrow_back,color: ColorsConfig.primaryColor,),
          onPressed: () { Navigator.pop(context);},
        ),
        //2. ? 控制是否应该尝试暗示前导小部件为null
        automaticallyImplyLeading:true ,
        //3.当前界面的标题文字
        title: Text(widget.option.params["title"],style: TextStyle(color: ColorsConfig.primaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
        //4.一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；
        //对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
        actions: <Widget>[
          Observer(builder: (_) =>new IconButton( // action button
            icon: Icon(_peotryModel.isLike()?Icons.favorite:Icons.favorite_border,color: ColorsConfig.PRIMARY_YELLOW),
            onPressed: () {
              _peotryModel.setLike(!_peotryModel.isLike());
            },
          ))
        ],

        //5.一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，
        // 可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          centerTitle: true,
           //background: PeotryWidget("将进酒","【唐】李白","君不见，黄河之水天上来<br> \r 奔流到海不复回 \r\n 君不见，高堂明镜悲白发, \r 朝如青丝暮成雪"'),
           background:   Image.asset(Constant.dir_image+widget.option.params["gifimage"],fit: BoxFit.contain),
        ),

        //6.一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
        bottom: BaseViewBar(preferredSize: Size.fromHeight(160.0),childView:Column(children:<Widget>[
        PeotryViewWidget(content:widget.option.params["content"]),new TabBar(
          indicatorColor:ColorsConfig.primaryColor,
          controller: _tabController,
          labelColor: ColorsConfig.PRIMARY_GRAY_333,
          labelStyle: TextStyle(fontSize: 18,decorationStyle: TextDecorationStyle.dashed),
          isScrollable: true,
          tabs: choices.asMap().keys.map( (key) {
            return new Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child:Center(child:
                    Text(choices.elementAt(key).title))),
                    /*key==choices.length-1?Container():Container(
                      width: 2,
                      margin: EdgeInsets.only(left:8,right:8,top: 15, bottom: 15),
                      color: ColorsConfig.PRIMARY_YELLOW,
                    )*/
                  ],
                )
              //icon: new Icon(choice.icon),
            );
          }).toList())]),
        ) ,

        //7.? 材料设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，
        // 当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
        elevation: 1,

        //APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
        backgroundColor: ColorsConfig.PRIMARY_WHITE,

        //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
        brightness:Brightness.light ,

        //App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
        //iconTheme: ThemeData().primaryIconTheme,

        //App bar 上的文字主题。默认值为 ThemeData（）.primaryTextTheme
        //textTheme: ThemeData().accentTextTheme,

        //此应用栏是否显示在屏幕顶部
        primary: true,

        //标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
        centerTitle: true,
        //横轴上标题内容 周围的间距
        titleSpacing: NavigationToolbar.kMiddleSpacing,

        //展开高度
        expandedHeight: 480,

        //是否随着滑动隐藏标题
        floating: false,

        //tab 是否固定在顶部
        pinned: true,

        //与floating结合使用
        snap: false,

      )

    ];
  }


  Widget _buildBottom(){
   return _fixTabBarView=FixTabBarView(pageController: _pageController,tabController: _tabController, children: choices.map((Choice choice) {
      return new Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Padding(padding:EdgeInsets.all(14) ,child:Text(
            choice.content,
            style: Theme.of(context).textTheme.body2,
          ),
          ));
    }).toList());
  }

  initParam(){
    choices = <Choice>[
       Choice(title: '作者简介', icon: Icons.directions_car,content:widget.option.params["author"]),
       Choice(title: '注释', icon: Icons.directions_bike,content:widget.option.params["zhushi"]),
       Choice(title: '译文', icon: Icons.directions_boat,content:widget.option.params["yiwen"]),
       Choice(title: '赏析', icon: Icons.directions_bus,content:widget.option.params["shangxi"]),
    ];
  }

  @override
  Widget build(BuildContext context) {

    print("${widget.option.params['title']} ----> ");
    return new Scaffold(floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,floatingActionButton:FloatingActionButton(child: Icon(Icons.play_circle_outline),onPressed: (){

    },),body: NestedScrollView(headerSliverBuilder: _headerSliverBuilder,
        body: _buildBottom()));
  }
}
class Choice {
   Choice({ this.title, this.icon,this.content});
  final String title;
  final IconData icon;
  final String content;

}

