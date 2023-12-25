import 'package:flutter/material.dart';
import 'todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  TodoProvider() {  loadTodos();  }

  List<Todo> get todos => _todos;
  List<Todo> get completedTodos => _todos.where((todo) => todo.isDone).toList();
  

  void addTodo(Todo todo) {
    _todos.add(todo);
    saveTodos();
    notifyListeners();
  }

  void toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    saveTodos();
    notifyListeners();
  }

  void saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = json.encode(
      _todos.map((todo) => todo.toJson()).toList(),
    );
    
    await prefs.setString('todos', encodedData);
  }

  void loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('todos');
   
    if (encodedData != null) {
      final List<dynamic> decodedData = json.decode(encodedData);
   
      _todos = decodedData.map((item) => Todo.fromJson(item)).toList();
      
      notifyListeners();
    }
  }
}