// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IndexModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$IndexModel on _IndexModel, Store {
  final _$showAtom = Atom(name: '_IndexModel.show');

  @override
  bool get show {
    _$showAtom.context.enforceReadPolicy(_$showAtom);
    _$showAtom.reportObserved();
    return super.show;
  }

  @override
  set show(bool value) {
    _$showAtom.context.conditionallyRunInAction(() {
      super.show = value;
      _$showAtom.reportChanged();
    }, _$showAtom, name: '${_$showAtom.name}_set');
  }

  final _$_IndexModelActionController = ActionController(name: '_IndexModel');

  @override
  void setShow(bool ishow) {
    final _$actionInfo = _$_IndexModelActionController.startAction();
    try {
      return super.setShow(ishow);
    } finally {
      _$_IndexModelActionController.endAction(_$actionInfo);
    }
  }
}
