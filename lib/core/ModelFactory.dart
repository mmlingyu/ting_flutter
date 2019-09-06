
import 'package:ainong/viewmodel/IndexModel.dart';

import 'IViewModel.dart';

class ModelFactory{
  /*ModelFactory._();

  static ModelFactory _instance;

  static ModelFactory _getIntance(){
    if(_instance == null){
      _instance = new ModelFactory._();
    }
    return _instance;
  }*/

  ModelFactory._();

  static ModelFactory _instance;
  static ModelFactory get instance => _getInstance();
  static Map<String,IViewModel> _modelMap;
  static ModelFactory _getInstance() {
    if (_instance == null) {
      _instance = new ModelFactory._();
      _modelMap = new Map();
      // ignore: argument_type_not_assignable
      //_modelMap.putIfAbsent("IndexModel", new IndexModel());
    }
    return _instance;
  }

  IViewModel of(String cls){
     if(!_modelMap.containsKey(cls))return new IViewModel();
     IViewModel viewModel;
      Iterator<MapEntry<String,IViewModel>> it =  _modelMap.entries.iterator;
      while(it.moveNext()){
        String key = it.current.key;
        if(key == cls){
          viewModel = it.current.value;
          break;
        }
      };
      return viewModel;

  }




}