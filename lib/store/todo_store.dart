import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
	
	_TodoStore(this.tiitle);
	
  final String tiitle;

  @observable
  bool done =false;

  @action
  void doneToggle() => done = !done;
}
