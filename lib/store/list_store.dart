import 'package:mobx/mobx.dart';
import 'package:todomobx/store/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
	
	ObservableList<TodoStore> todoList = ObservableList<TodoStore>();
	
	@computed
	int get listSize => todoList.length??0;
	
	@observable
	String _newTodo = "";
	
	@computed
	bool get isTextFieldValid => _newTodo.trim().isNotEmpty && _newTodo.trim().length>=3;
	
	@action
	void updateTodo(String todo) => _newTodo = todo;
	
	
	@action
	Future<void> addTodo() async{
		todoList.insert(0,TodoStore(_newTodo));
		await Future.delayed(Duration(seconds: 2));
		todoList.sort((t1,t2){
			return t1.done?1:0;
		});
		_newTodo = "";
	}
	
	
	@computed
	Function get onAddTap => isTextFieldValid?addTodo:null;
	
	
}
