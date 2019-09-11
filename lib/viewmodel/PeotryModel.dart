
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'PeotryModel.g.dart';
class PeotryModel = _PeotryModel with _$PeotryModel;
abstract class _PeotryModel with Store {
  @observable
  bool islike = false;

  @action
  void setLike(bool like){
     this.islike = like;
  }

  @computed
  bool isLike(){
    return this.islike;
  }

  @override
  void dispose() {
    super.dispose();
  }
  
}