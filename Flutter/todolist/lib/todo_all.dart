import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/task.dart';

class TodoAll extends StatefulWidget {
  const TodoAll({super.key});

  @override
  State<TodoAll> createState() => _TodoAllState();
}

class _TodoAllState extends State<TodoAll> {
  todoTask task = todoTask();
  // Map<String, bool> isChanged = {};
  // List<String> Uncomplete = [];
  // List<String> Complete = [];
  Future<void> saveCheck(bool isCheck, String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      task.isChanged[data] = isCheck;
    });

    task.Complete = prefs.getStringList('Complete') ?? [];

    if (task.isChanged[data]!) {
      task.Complete.add(data);
      task.Uncomplete.remove(data);
    } else {
      task.Complete.remove(data);
      task.Uncomplete.add(data);
    }
    await prefs.setBool(data, isCheck);
    await prefs.setStringList('Complete', task.Complete);
    await prefs.setStringList('Uncomplete', task.Uncomplete);
  }

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      task.Complete = prefs.getStringList('Complete') ?? [];
      task.Uncomplete = prefs.getStringList('Uncomplete') ?? [];
      for (int i = 0; i < task.Uncomplete.length; i++) {
        task.isChanged[task.Uncomplete[i]] = prefs.getBool(task.Uncomplete[i]) ?? false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: task.Uncomplete.length,
        itemBuilder: (context, index) {
          final String todoItem = task.Uncomplete[index];
          final bool isChecked = task.isChanged[todoItem] ?? false;

          return ListTile(
            leading: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  saveCheck(value!, todoItem);
                });
              },
            ),
            title: Text(
              todoItem,
              style: TextStyle(
                  decoration: (task.isChanged[todoItem] ?? false)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          );
        },
      ),
    );
  }
}