import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
	
	ObservableList<String> todoList = ObservableList<String>();
	
	@computed
	int get listSize => todoList.length??0;
	
	@observable
	String _newTodo = "";
	
	@computed
	bool get isTextFieldValid => _newTodo.isNotEmpty && _newTodo.length>=3;
	
	@observable
	bool loading = false;
	
	@observable
	bool hasUser = true;
	
	@action
	void updateTodo(String todo) => _newTodo = todo;
	
	@action
	Future<void> logout() async{
		loading = true;
		await Future.delayed(Duration(seconds: 2));
		hasUser = false;
		loading = false;
	}
	
	@computed
	 Function get logoutPresses => loading?logout:null;
	
	
	@action
	Future<void> addTodo() async{
		loading=true;
		await Future.delayed(Duration(seconds: 2));
		todoList.add(_newTodo);
		print(todoList);
		loading=false;
	}
	
	
	@computed
	Function get onAddTap => isTextFieldValid&&!loading?addTodo:null;
	
	
}
