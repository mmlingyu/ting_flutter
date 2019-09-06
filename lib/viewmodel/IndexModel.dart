
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'IndexModel.g.dart';
class IndexModel = _IndexModel with _$IndexModel;
abstract class _IndexModel with Store {

  @observable
  bool show = false;

  @action
  void setShow(bool ishow){
     this.show = ishow;
  }

  @computed
  bool getShow(){
    print("get show--->${show}"); //打印滚动位置
    return this.show;
  }

  ScrollController scrollController = new ScrollController();

  _IndexModel(){
    scrollController.addListener(() {
      if (scrollController.offset < 400) {
        setShow(false);
        print("${scrollController.offset}hidden--->${show}"); //打印滚动位置
      }else if(scrollController.offset >= 400){
        setShow(true);
        print("${scrollController.offset}show--->${show}"); //打印滚动位置
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  
}