import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';

class TodoListView extends StatelessWidget {
  final bool showCompleted;

  TodoListView(this.showCompleted);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = showCompleted
        ? provider.completedTodos
        : provider.todos.where((todo) => !todo.isDone).toList();
    
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (_) {
              provider.toggleTodoStatus(todo);
              for(int i =0;i< todos.length; i++){
              print("在listview_todos:${todos[i].title}");
              }
              
            },
          ),
        );
      },
    );
  }
}