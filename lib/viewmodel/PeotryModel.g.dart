// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PeotryModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$PeotryModel on _PeotryModel, Store {
  final _$islikeAtom = Atom(name: '_PeotryModel.islike');

  @override
  bool get islike {
    _$islikeAtom.context.enforceReadPolicy(_$islikeAtom);
    _$islikeAtom.reportObserved();
    return super.islike;
  }

  @override
  set islike(bool value) {
    _$islikeAtom.context.conditionallyRunInAction(() {
      super.islike = value;
      _$islikeAtom.reportChanged();
    }, _$islikeAtom, name: '${_$islikeAtom.name}_set');
  }

  final _$_PeotryModelActionController = ActionController(name: '_PeotryModel');

  @override
  void setLike(bool like) {
    final _$actionInfo = _$_PeotryModelActionController.startAction();
    try {
      return super.setLike(like);
    } finally {
      _$_PeotryModelActionController.endAction(_$actionInfo);
    }
  }
}
