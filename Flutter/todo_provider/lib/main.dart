import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'todo_provider.dart';
import 'todo_model.dart';
import 'todo_listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MaterialApp(
        title: 'Todo List',
        home: TodoListPage(),
        debugShowCheckedModeBanner: false,
=======

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
>>>>>>> f58689aec1252e0c7dd36458b46dbbf0357378d8
      ),
    );
  }
}
<<<<<<< HEAD

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
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
              });
            },
            tabs: const [
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
        floatingActionButton: _currentIndex == 0
            ? FloatingActionButton(
                onPressed: () => _showAddTodoDialog(context),
                child: Icon(Icons.add),
              )
            : null,
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            onChanged: (value) => title = value,
            decoration: const InputDecoration(hintText: 'Todo title'),
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
=======
>>>>>>> f58689aec1252e0c7dd36458b46dbbf0357378d8
