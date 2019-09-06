import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class NavigationIconView {

   BottomNavigationBarItem item;
  final AnimationController controller;
  // 类似于 java 中的构造方法
  // 创建 NavigationIconView 需要传入三个参数， icon 图标，title 标题， TickerProvider
  NavigationIconView({Widget icon, Widget title, TickerProvider vsync}):
        item = new BottomNavigationBarItem(
          icon: icon,
          title: title,
        ),
        controller = new AnimationController(
            duration: kThemeAnimationDuration,    // 设置动画持续的时间
            vsync: vsync                          // 默认属性和参数
        );
}
