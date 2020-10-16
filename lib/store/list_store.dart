import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
	
	@observable
	String _newTodo = "";
	
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
	
	ObserverList todoList;
	
}
