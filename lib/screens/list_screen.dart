import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todomobx/store/list_store.dart';
import 'package:todomobx/store/login_store.dart';
import 'package:todomobx/store/todo_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'login_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListStore _listStore = ListStore();

  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    Observer(
                      builder: (_) => IconButton(
                        icon: Provider.of<LoginStore>(context).isLoading
                            ? CircularProgressIndicator()
                            : Icon(Icons.exit_to_app),
                        color: Colors.white,
                        onPressed: (){
                        	Provider.of<LoginStore>(context, listen: false).logout();
                        	Navigator.pushReplacement(context,
			                        MaterialPageRoute(builder: (_)=>LoginScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) => CustomTextField(
                            hint: 'Tarefa',
                            onChanged: _listStore.updateTodo,
                            suffix: CustomIconButton(
                              radius: 32,
                              iconData: _listStore.isTextFieldValid
                                  ? Icons.add
                                  : Icons.short_text,
                              onTap: _listStore.onAddTap,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Observer(
                          builder: (_) => Expanded(
                            child: ListView.separated(
                              itemCount: _listStore.listSize,
                              itemBuilder: (_, index) {
                                TodoStore item =
                                    _listStore.todoList.elementAt(index);
                                return Observer(
                                  builder: (_) => ListTile(
                                    title: Text(
                                      '${item.tiitle}',
                                      style: item.done
                                          ? TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough)
                                          : null,
                                    ),
                                    onTap: item.doneToggle,
                                  ),
                                );
                              },
                              separatorBuilder: (_, __) {
                                return Divider();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
