// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  Computed<int> _$listSizeComputed;

  @override
  int get listSize => (_$listSizeComputed ??=
          Computed<int>(() => super.listSize, name: '_ListStore.listSize'))
      .value;
  Computed<bool> _$isTextFieldValidComputed;

  @override
  bool get isTextFieldValid => (_$isTextFieldValidComputed ??= Computed<bool>(
          () => super.isTextFieldValid,
          name: '_ListStore.isTextFieldValid'))
      .value;
  Computed<Function> _$onAddTapComputed;

  @override
  Function get onAddTap => (_$onAddTapComputed ??=
          Computed<Function>(() => super.onAddTap, name: '_ListStore.onAddTap'))
      .value;

  final _$_newTodoAtom = Atom(name: '_ListStore._newTodo');

  @override
  String get _newTodo {
    _$_newTodoAtom.reportRead();
    return super._newTodo;
  }

  @override
  set _newTodo(String value) {
    _$_newTodoAtom.reportWrite(value, super._newTodo, () {
      super._newTodo = value;
    });
  }

  final _$addTodoAsyncAction = AsyncAction('_ListStore.addTodo');

  @override
  Future<void> addTodo() {
    return _$addTodoAsyncAction.run(() => super.addTodo());
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void updateTodo(String todo) {
    final _$actionInfo =
        _$_ListStoreActionController.startAction(name: '_ListStore.updateTodo');
    try {
      return super.updateTodo(todo);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listSize: ${listSize},
isTextFieldValid: ${isTextFieldValid},
onAddTap: ${onAddTap}
    ''';
  }
}
