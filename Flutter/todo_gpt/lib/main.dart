import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo List',
        home: TodoListPage(),
      ),
    );
  }
}
class Todo {
  String title;
  bool isDone;

  Todo({required this.title, this.isDone = false});

  Map<String, dynamic> toJson() => {
    'title': title,
    'isDone': isDone,
  };

  static Todo fromJson(Map<String, dynamic> json) => Todo(
    title: json['title'],
    isDone: json['isDone'],
  );
}

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  TodoProvider() {
    loadTodos();
  }

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


class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                print("onTap:$index");
              });
            },
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Todos'),
              Tab(icon: Icon(Icons.done_all), text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TodoListView(false),
            TodoListView(true),
          ],
        ),
        floatingActionButton: _currentIndex == 0 ? FloatingActionButton(
          onPressed: () => _showAddTodoDialog(context),
          child: Icon(Icons.add),
        ) : null,
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            onChanged: (value) => title = value,
            decoration: InputDecoration(hintText: 'Todo title'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty) {
                  Provider.of<TodoProvider>(context, listen: false)
                      .addTodo(Todo(title: title));
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class TodoListView extends StatelessWidget {
  final bool showCompleted;

  TodoListView(this.showCompleted);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = showCompleted ? provider.completedTodos : provider.todos.where((todo) => !todo.isDone).toList();

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
            },
          ),
        );
      },
    );
  }
}
